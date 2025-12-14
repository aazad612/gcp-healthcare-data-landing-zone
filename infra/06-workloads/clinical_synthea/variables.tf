variable "impersonate_service_account" {
  description = "Service Account to impersonate."
  type        = string
}

variable "environments" {
  description = "List of environments to deploy (e.g., ['dev', 'test', 'qa'])."
  type        = set(string)
}

variable "data_location" {
  description = "Region for Datasets and Buckets."
  type        = string
  default     = "US"
}

variable "env_project_keys" {
  description = "Map of SDLC environments to their Domain project keys (e.g., dev = clin_syn_np)."
  type = map(string)
}