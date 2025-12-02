// Boolean org policies (enforced true/false)
resource "google_org_policy" "boolean_policies" {
  for_each  = var.org_boolean_policies
  org_id    = var.org_id
  constraint = each.value.constraint

  boolean_policy {
    enforced = each.value.enforced
  }
}

// List-based org policies (allow/deny lists)
resource "google_org_policy" "list_policies" {
  for_each  = var.org_list_policies
  org_id    = var.org_id
  constraint = each.value.constraint

  list_policy {
    allow {
      all    = each.value.allow_all
      values = each.value.allowed_values
    }

    deny {
      all    = each.value.deny_all
      values = each.value.denied_values
    }
  }
}
