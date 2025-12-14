# Grant the Default SA "Data Editor" on all datasets
resource "google_bigquery_dataset_access" "sa_editor_bronze" {
  for_each = var.environments

  dataset_id    = google_bigquery_dataset.bronze[each.key].dataset_id
  project       = local.env_project_ids[each.key]
  role          = "roles/bigquery.dataEditor"
  
  # FIX: Use the Service Account Map
  user_by_email = local.env_service_accounts[each.key]
}

resource "google_bigquery_dataset_access" "sa_editor_silver" {
  for_each = var.environments

  dataset_id    = google_bigquery_dataset.silver[each.key].dataset_id
  project       = local.env_project_ids[each.key]
  role          = "roles/bigquery.dataEditor"
  user_by_email = local.env_service_accounts[each.key]
}

resource "google_bigquery_dataset_access" "sa_editor_gold" {
  for_each = var.environments

  dataset_id    = google_bigquery_dataset.gold[each.key].dataset_id
  project       = local.env_project_ids[each.key]
  role          = "roles/bigquery.dataEditor"
  user_by_email = local.env_service_accounts[each.key]
}

resource "google_bigquery_dataset_access" "sa_owner_interface" {
  for_each = var.environments

  dataset_id    = google_bigquery_dataset.interface[each.key].dataset_id
  project       = local.env_project_ids[each.key]
  role          = "roles/bigquery.dataOwner"
  user_by_email = local.env_service_accounts[each.key]
}