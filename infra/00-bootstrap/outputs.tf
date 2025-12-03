output "seed_project_id" {
  value = google_project.seed_project.project_id
}

output "gcs_bucket_tfstate" {
  value = google_storage_bucket.tf_state.name
  description = "Copy this bucket name into the backend.tf of folders 01-06"
}

output "terraform_sa_email" {
  value = google_service_account.terraform_sa.email
  description = "Use this Service Account to run future apply commands"
}


