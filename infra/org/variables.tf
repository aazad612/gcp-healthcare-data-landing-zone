variable "impersonate_service_account" {
  type        = string
  description = "Service account email to impersonate for org-level operations."
}

variable "org_id" {
  type        = string
  description = "Numeric Organization ID (e.g., 9139207439)."
}

variable "top_level_folders" {
  description = <<EOT
Map of logical folder keys to display names.
Example keys: networking, shared_services, healthcare_platform, business_units,
data_governance, sandboxes.
EOT
  type = map(string)
}

variable "org_iam_bindings" {
  description = <<EOT
Map of org-level IAM bindings.
Key is an arbitrary label (e.g., 'org_viewer', 'org_admins').
Each value:
- role: IAM role name
- members: list of member strings
EOT
  type = map(object({
    role    = string
    members = list(string)
  }))
}

variable "folder_iam_bindings" {
  description = <<EOT
Map of folder-level IAM bindings.
Key is an arbitrary label (e.g., 'fd_networking_admins').
Each value:
- folder_key: key from var.top_level_folders (e.g., 'networking')
- role: IAM role name
- members: list of member strings
EOT
  type = map(object({
    folder_key = string
    role       = string
    members    = list(string)
  }))
}

variable "org_boolean_policies" {
  description = <<EOT
Map of boolean org policies.
Each entry:
- constraint: org policy constraint name
- enforced: true/false
EOT
  type = map(object({
    constraint = string
    enforced   = bool
  }))
}

variable "org_list_policies" {
  description = <<EOT
Map of list-based org policies.
Each entry:
- constraint: org policy constraint name
- allow_all: true/false
- deny_all: true/false
- allowed_values: list of allowed values (if any)
- denied_values: list of denied values (if any)
EOT
  type = map(object({
    constraint      = string
    allow_all       = bool
    deny_all        = bool
    allowed_values  = list(string)
    denied_values   = list(string)
  }))
}

variable "billing_account_iam_bindings" {
  description = <<EOT
IAM bindings for billing accounts.
Each entry:
- billing_account_id: billing account ID string
- role: IAM role
- members: list of member strings
EOT
  type = map(object({
    billing_account_id = string
    role               = string
    members            = list(string)
  }))
}

variable "billing_folder_mapping" {
  description = <<EOT
Mapping of billing logical keys to folder keys.
Example:
{
  "clinical_billing"   = { billing_account_id = "...", folder_keys = ["healthcare_platform"] }
  "shared_services_ba" = { billing_account_id = "...", folder_keys = ["shared_services"] }
}
EOT
  type = map(object({
    billing_account_id = string
    folder_keys        = list(string)
  }))
}
