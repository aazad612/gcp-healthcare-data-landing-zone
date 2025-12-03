variable "impersonate_service_account" {
  type = string
}

variable "billing_account_id" {
  type = string
}

variable "subnets" {
  description = "Centralized configuration for all subnets in the organization."
  type = map(object({
    name   = string
    cidr   = string
    region = string
  }))
}


variable "host_projects" {
  description = "Configuration for Host Projects (ID, Name, Folder placement)."
  type = map(object({
    project_id = string
    folder_key = string
    vpc_name   = string
  }))
}