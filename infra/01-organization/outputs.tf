output "org_id" {
  value = var.org_id
}

output "folder_ids" {
  description = "Map of logical key to GCP Folder ID (e.g. folders/12345)"
  value       = { for k, v in google_folder.top_level : k => v.name }
}