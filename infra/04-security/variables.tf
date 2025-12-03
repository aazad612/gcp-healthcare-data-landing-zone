variable "impersonate_service_account" { type = string }
variable "org_id"                      { type = string }
variable "corp_vpn_cidrs" {
  description = "List of public IPs for Corporate VPN to allow access."
  type        = list(string)
}