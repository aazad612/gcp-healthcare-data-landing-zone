############################################################
# modules/project_factory/outputs.tf
############################################################

output "project_id" {
  description = "Project ID."
  value       = google_project.this.project_id
}

output "project_number" {
  description = "Numeric project number."
  value       = google_project.this.number
}

output "project_name" {
  description = "Display name of the project."
  value       = google_project.this.name
}
