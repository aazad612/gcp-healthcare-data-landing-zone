resource "google_access_context_manager_access_policy" "org_policy" {
  parent = "organizations/${var.org_id}"
  title  = "Aazads Org Security Policy"
}

# --- Access Level: Corporate VPN ---
# Allows API access from your on-premise IP ranges
resource "google_access_context_manager_access_level" "corp_vpn" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}/accessLevels/corp_vpn_access"
  title  = "Corporate VPN Access"

  basic {
    conditions {
      ip_subnetworks = var.corp_vpn_cidrs # e.g. ["1.2.3.4/32"]
    }
  }
}