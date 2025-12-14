# --- 1. BRONZE (Raw Ingestion) ---
resource "google_bigquery_dataset" "bronze" {
  for_each = var.environments

  dataset_id    = "synthea_bronze_${each.key}"
  # FIX: Use Map Lookup
  project       = local.env_project_ids[each.key]
  friendly_name = "Synthea Bronze (${each.key})"
  location      = var.data_location
  
  labels = {
    env   = each.key
    layer = "bronze"
    pii   = "true"
  }
}

# --- 2. SILVER (Cleaned/Enriched) ---
resource "google_bigquery_dataset" "silver" {
  for_each = var.environments

  dataset_id    = "synthea_silver_${each.key}"
  project       = local.env_project_ids[each.key]
  friendly_name = "Synthea Silver (${each.key})"
  location      = var.data_location

  labels = {
    env   = each.key
    layer = "silver"
  }
}

# --- 3. GOLD (Aggregated/Modeled) ---
resource "google_bigquery_dataset" "gold" {
  for_each = var.environments

  dataset_id    = "synthea_gold_${each.key}"
  project       = local.env_project_ids[each.key]
  friendly_name = "Synthea Gold (${each.key})"
  location      = var.data_location

  labels = {
    env   = each.key
    layer = "gold"
  }
}

# --- 4. INTERFACE (Consumption/Views) ---
resource "google_bigquery_dataset" "interface" {
  for_each = var.environments

  dataset_id    = "synthea_consumption_${each.key}"
  project       = local.env_project_ids[each.key]
  friendly_name = "Synthea Published (${each.key})"
  location      = var.data_location
  description   = "Public interface. Contains Authorized Views only."

  labels = {
    env   = each.key
    layer = "interface"
  }
}

# --- 5. GCS Buckets (Data Lake) ---
resource "google_storage_bucket" "data_lake" {
  for_each = var.environments

  # FIX: Ensure bucket includes the correct project suffix
  name          = "bkt-clin-syn-lake-${each.key}-${local.env_project_ids[each.key]}"
  project       = local.env_project_ids[each.key]
  location      = var.data_location
  force_destroy = false
  
  uniform_bucket_level_access = true
}

# # --- 6. Dataflow Staging Buckets ---
# resource "google_storage_bucket" "dataflow_temp" {
#   for_each = var.environments

#   name          = "bkt-clin-syn-df-temp-${each.key}-${local.env_project_ids[each.key]}"
#   project       = local.env_project_ids[each.key]
#   location      = var.data_location
#   force_destroy = false
  
#   uniform_bucket_level_access = true
# }

# --- 7. PUBSUB PIPELINE ---

resource "google_pubsub_topic" "ingestion_topic" {
  for_each = var.environments

  name    = "topic-synthea-ingestion-${each.key}"
  project = local.env_project_ids[each.key]
}

resource "google_pubsub_topic_iam_binding" "binding" {
  for_each = var.environments

  topic   = google_pubsub_topic.ingestion_topic[each.key].id
  role    = "roles/pubsub.publisher"
  
  # FIX: Use the GCS SA Map we created in data.tf
  members = ["serviceAccount:${local.env_gcs_service_accounts[each.key]}"]
}

resource "google_storage_notification" "bucket_notification" {
  for_each = var.environments

  bucket         = google_storage_bucket.data_lake[each.key].name
  payload_format = "JSON_API_V1"
  topic          = google_pubsub_topic.ingestion_topic[each.key].id
  event_types    = ["OBJECT_FINALIZE"]

  depends_on = [google_pubsub_topic_iam_binding.binding]
}

resource "google_pubsub_subscription" "dataflow_sub" {
  for_each = var.environments

  name    = "sub-dataflow-ingest-${each.key}"
  project = local.env_project_ids[each.key]
  topic   = google_pubsub_topic.ingestion_topic[each.key].id

  ack_deadline_seconds = 600
  
  expiration_policy {
    ttl = "" 
  }
}