impersonate_service_account = "johneysadmin@johneysadminproject.iam.gserviceaccount.com"

# Creating all 3 non-prod SDLC environments in one go
environments = ["dev", "uat", "qa"]

# 2. Map them to the Project Keys from Layer 05
env_project_keys = {
  "dev"  = "clin_syn_np"   # <--- CRITICAL: Maps 'dev' to existing NP project (Preserves Data)
  "uat" = "clin_syn_uat"  # Maps 'test' to the new UAT project
  "qa"   = "clin_syn_qa"   # Maps 'qa' to the new QA project
}