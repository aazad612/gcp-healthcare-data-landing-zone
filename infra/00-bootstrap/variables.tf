variable "org_id" {
  description = "The numeric Organization ID"
  type        = string
}

variable "billing_account" {
  description = "The alphanumeric Billing Account ID"
  type        = string
}

variable "region" {
  default = "us-central1"
}

