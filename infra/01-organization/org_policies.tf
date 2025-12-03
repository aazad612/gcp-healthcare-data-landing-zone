# Boolean Constraints (True/False)
resource "google_org_policy_policy" "boolean" {
  for_each = var.org_boolean_policies

  name   = "organizations/${var.org_id}/policies/${each.value.constraint}"
  parent = "organizations/${var.org_id}"

  spec {
    rules {
      enforce = each.value.enforced ? "TRUE" : "FALSE"
    }
  }
}

# List Constraints (Allow/Deny)
resource "google_org_policy_policy" "list" {
  for_each = var.org_list_policies

  name   = "organizations/${var.org_id}/policies/${each.value.constraint}"
  parent = "organizations/${var.org_id}"

  spec {
    rules {
      values {
        allowed_values = each.value.allowed_values
        denied_values  = each.value.denied_values
      }
    }
  }
}