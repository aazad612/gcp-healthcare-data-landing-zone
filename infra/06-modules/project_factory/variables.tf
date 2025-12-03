############################################################
# modules/project_factory/variables.tf
############################################################

variable "name" {
  description = "Human-friendly project name."
  type        = string
}

variable "project_id" {
  description = "GCP project ID (must be globally unique, <= 30 chars)."
  type        = string
}

variable "org_id" {
  description = "Organization ID. Required if folder_id is empty."
  type        = string
  default     = ""
}

variable "folder_id" {
  description = "Folder ID (numeric, without folders/ prefix). Required if org_id is empty."
  type        = string
  default     = ""
}

variable "billing_account_id" {
  description = "Billing account ID in the form XXXXXX-XXXXXX-XXXXXX."
  type        = string
}

variable "activate_apis" {
  description = "List of APIs to enable on the project."
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Labels applied to the project."
  type        = map(string)
  default     = {}
}

variable "owner_members" {
  description = "IAM members to grant roles/owner on the project (e.g. groups/cloud-platform-admins@...)."
  type        = list(string)
  default     = []
}
