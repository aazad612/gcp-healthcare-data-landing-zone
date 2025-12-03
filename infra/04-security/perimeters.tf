# --- Clinical Perimeter ---
# Protects PHI (Protected Health Information)
resource "google_access_context_manager_service_perimeter" "clinical" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}/servicePerimeters/sp_clinical"
  title  = "Clinical Perimeter"

  status {
    # 1. Who is protected? (Host + Service Projects)
    resources = [
      "projects/${local.host_ids["clinical"]}",       # The Network Project
      "projects/${local.svc_ids["clin_syn_np"]}",    # The Data Project
      "projects/${local.svc_ids["clin_syn_pd"]}"     # The Prod Data Project
    ]

    # 2. What services are restricted? (The Data Exfiltration Services)
    restricted_services = [
      "bigquery.googleapis.com",
      "storage.googleapis.com",
      "dataflow.googleapis.com"
    ]

    # 3. Who can bypass this wall? (Your VPN)
    access_levels = [
      google_access_context_manager_access_level.corp_vpn.name
    ]
  }
}

# --- Enterprise Perimeter ---
# Protects Financial/HR Data
resource "google_access_context_manager_service_perimeter" "enterprise" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}/servicePerimeters/sp_enterprise"
  title  = "Enterprise Perimeter"

  status {
    resources = [
      "projects/${local.host_ids["enterprise"]}",
      "projects/${local.svc_ids["ent_fin_np"]}",
      "projects/${local.svc_ids["ent_hr_np"]}"
    ]

    restricted_services = [
      "bigquery.googleapis.com",
      "storage.googleapis.com"
    ]

    access_levels = [google_access_context_manager_access_level.corp_vpn.name]
  }
}

# --- Research Perimeter ---
# Protects ML Models and IP
resource "google_access_context_manager_service_perimeter" "research" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}/servicePerimeters/sp_research"
  title  = "Research Perimeter"

  status {
    resources = [
      "projects/${local.host_ids["research"]}",
      "projects/${local.svc_ids["res_ml_np"]}"
    ]

    restricted_services = [
      "bigquery.googleapis.com",
      "notebooks.googleapis.com",  # Vertex AI Workbench
      "storage.googleapis.com"
    ]
    
    access_levels = [google_access_context_manager_access_level.corp_vpn.name]
  }
}