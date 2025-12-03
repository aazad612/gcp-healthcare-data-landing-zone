variable "impersonate_service_account" {
  description = "The Service Account Email to impersonate for operations."
  type        = string
}

variable "org_id" {
  description = "The numeric Organization ID."
  type        = string
}

variable "top_level_folders" {
  description = "Map of logical keys to Folder Display Names."
  type        = map(string)
}

variable "org_iam_members" {
  description = "List of Org-level IAM assignments."
  type = list(object({
    role   = string
    member = string
  }))
}

variable "folder_iam_members" {
  description = "List of Folder-level IAM assignments."
  type = list(object({
    folder_key = string
    role       = string
    member     = string
  }))
}

variable "billing_iam_members" {
  description = "List of Billing Account IAM assignments."
  type = list(object({
    billing_account_id = string
    role               = string
    member             = string
  }))
}

variable "org_boolean_policies" {
  description = "Map of boolean constraints (true/false)."
  type = map(object({
    constraint = string
    enforced   = bool
  }))
}

variable "org_list_policies" {
  description = "Map of list constraints (allowed/denied values)."
  type = map(object({
    constraint     = string
    deny_all       = bool
    allowed_values = list(string)
    denied_values  = list(string)
  }))
}