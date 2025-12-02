output "top_level_folder_ids" {
  description = "Map of logical folder keys to folder resource names."
  value       = { for k, f in google_folder.top_level : k => f.name }
}

output "org_id" {
  description = "Organization ID."
  value       = var.org_id
}

output "billing_folder_mapping" {
  description = "Mapping from billing config keys to folder keys and billing accounts."
  value       = var.billing_folder_mapping
}
