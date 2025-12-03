variable "org_id" {
  description = "Organization ID (9139207439 for aazads.us). Leave empty if using folder-only assignment."
  type        = string
  default     = ""
}

variable "folder_id" {
  description = "Folder ID (numeric, without folders/ prefix) where this project should live."
  type        = string
  default     = ""
}

variable "billing_account_id" {
  description = "Billing account ID to attach to the project."
  type        = string
}

variable "activate_apis" {
  description = "APIs to enable for this project."
  type        = list(string)
  default     = []
}

variable "owner_members" {
  description = "IAM members to grant roles/owner (e.g. group:cloud-platform-admins@aazads.us)."
  type        = list(string)
  default     = []
}
