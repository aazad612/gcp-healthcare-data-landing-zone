impersonate_service_account = "sa-org-admin@aazads-us-admin.iam.gserviceaccount.com"

org_id = "9139207439"

top_level_folders = {
  networking          = "fd-networking"
  shared_services     = "fd-shared-services"
  healthcare_platform = "fd-healthcare-platform"
  business_units      = "fd-business-units"
  data_governance     = "fd-data-governance"
  sandboxes           = "fd-sandboxes"
}

org_iam_bindings = {
  org_viewers = {
    role    = "roles/viewer"
    members = [
      "group:cloud-viewers@aazads.us",
    ]
  }

  org_admins = {
    role    = "roles/owner"
    members = [
      "group:cloud-platform-admins@aazads.us",
    ]
  }
}

folder_iam_bindings = {
  fd_networking_admins = {
    folder_key = "networking"
    role       = "roles/resourcemanager.folderAdmin"
    members    = [
      "group:netops-admins@aazads.us",
    ]
  }

  fd_healthcare_platform_admins = {
    folder_key = "healthcare_platform"
    role       = "roles/resourcemanager.folderAdmin"
    members    = [
      "group:healthcare-platform-admins@aazads.us",
    ]
  }
}

org_boolean_policies = {
  restrict_allowed_locations = {
    constraint = "constraints/gcp.resourceLocations"
    enforced   = true
  }
}

org_list_policies = {
  allowed_locations = {
    constraint      = "constraints/gcp.resourceLocations"
    allow_all       = false
    deny_all        = false
    allowed_values  = ["in:us-locations"]
    denied_values   = []
  }
}

billing_account_iam_bindings = {
  shared_services_ba_admins = {
    billing_account_id = "AAAAAA-BBBBBB-CCCCCC"
    role               = "roles/billing.admin"
    members            = [
      "group:finops-admins@aazads.us",
    ]
  }
}

billing_folder_mapping = {
  clinical_billing = {
    billing_account_id = "AAAAAA-BBBBBB-CCCCCC"
    folder_keys        = ["healthcare_platform"]
  }

  shared_services_billing = {
    billing_account_id = "DDDDDD-EEEEEE-FFFFFF"
    folder_keys        = ["shared_services"]
  }
}
