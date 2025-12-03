impersonate_service_account = "johneysadmin@johneysadminproject.iam.gserviceaccount.com"
billing_account_id          = "01D9F1-90D8BC-2AE0A2"
org_id                      = "9139207439"

service_projects = {
  # --- Clinical (Heavy Data Engineering) ---
  clin_syn_np = {
    project_id       = "prj-clin-syn-np"
    folder_key       = "healthcare_platform"
    host_project_key = "clinical"
    subnet_key       = "clin_int"
    apis = [
      "compute.googleapis.com",
      "bigquery.googleapis.com",
      "dataflow.googleapis.com",
      "composer.googleapis.com", # Cloud Composer (Airflow)
      "storage-component.googleapis.com"
    ]
  }

  # --- HR App (Standard Web/Compute) ---
  ent_hr_np = {
    project_id       = "prj-ent-hr-np"
    folder_key       = "business_units"
    host_project_key = "enterprise"
    subnet_key       = "ent_int"
    apis = [
      "compute.googleapis.com",
      "logging.googleapis.com",
      "monitoring.googleapis.com"
      # No Dataflow/BigQuery needed here
    ]
  }

  # --- Research (ML Focus) ---
  res_ml_np = {
    project_id       = "prj-res-ml-np"
    folder_key       = "sandboxes"
    host_project_key = "research"
    subnet_key       = "res_int"
    apis = [
      "compute.googleapis.com",
      "aiplatform.googleapis.com", # Vertex AI
      "notebooks.googleapis.com",
      "bigquery.googleapis.com"
    ]
  }
}