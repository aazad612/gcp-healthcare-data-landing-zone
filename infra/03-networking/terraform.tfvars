# 03-networking/terraform.tfvars

impersonate_service_account = "johneysadmin@johneysadminproject.iam.gserviceaccount.com"
billing_account_id          = "01D9F1-90D8BC-2AE0A2"

host_projects = {
  hub = {
    project_id = "prj-net-common-pd-host"
    folder_key = "networking"
    vpc_name   = "vpc-hub-main"
  }
  clinical = {
    project_id = "prj-net-clin-pd-host"
    folder_key = "networking"
    vpc_name   = "vpc-clin-prod"
  }
  enterprise = {
    project_id = "prj-net-ent-pd-host"
    folder_key = "networking"
    vpc_name   = "vpc-ent-prod"
  }
  research = {
    project_id = "prj-net-res-pd-host"
    folder_key = "networking"
    vpc_name   = "vpc-res-prod"
  }
}

subnets = {
  hub_main = {
    name   = "sb-hub-main-usc1"
    cidr   = "10.0.0.0/24"
    region = "us-central1"
  }
  clin_int = {
    name   = "sb-clin-prod-int-usc1"
    cidr   = "10.10.1.0/24"
    region = "us-central1"
  }
  clin_ext = {
    name   = "sb-clin-prod-ext-usc1"
    cidr   = "10.10.2.0/24"
    region = "us-central1"
  }
  ent_int = {
    name   = "sb-ent-prod-int-usc1"
    cidr   = "10.20.1.0/24"
    region = "us-central1"
  }
  res_int = {
    name   = "sb-res-prod-int-usc1"
    cidr   = "10.30.1.0/24"
    region = "us-central1"
  }
}