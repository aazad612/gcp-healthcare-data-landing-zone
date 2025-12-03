# Organization Level
resource "google_organization_iam_member" "org" {
  for_each = { for i, v in var.org_iam_members : "${v.role}-${v.member}" => v }

  org_id = var.org_id
  role   = each.value.role
  member = each.value.member
}

# Folder Level
resource "google_folder_iam_member" "folders" {
  for_each = { for i, v in var.folder_iam_members : "${v.folder_key}-${v.role}-${v.member}" => v }

  # Look up the real Folder ID from the resource created in folders.tf
  folder = google_folder.top_level[each.value.folder_key].name
  role   = each.value.role
  member = each.value.member
}

# Billing Account Level
resource "google_billing_account_iam_member" "billing" {
  for_each = { for i, v in var.billing_iam_members : "${v.billing_account_id}-${v.role}-${v.member}" => v }

  billing_account_id = each.value.billing_account_id
  role               = each.value.role
  member             = each.value.member
}