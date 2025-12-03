# 03-networking/outputs.tf

output "host_project_ids" {
  description = "Map of Host Project IDs."
  value = {
    hub        = google_project.hub_host.project_id
    clinical   = google_project.clin_host.project_id
    enterprise = google_project.ent_host.project_id
    research   = google_project.res_host.project_id
  }
}

output "vpc_ids" {
  description = "Map of VPC Network IDs (Self Links)."
  value = {
    hub        = google_compute_network.hub_vpc.id
    clinical   = google_compute_network.clin_vpc.id
    enterprise = google_compute_network.ent_vpc.id
    research   = google_compute_network.res_vpc.id
  }
}

output "subnet_ids" {
  description = "Map of Subnet IDs. Keys match the 'subnets' variable in tfvars."
  value = {
    # Hub
    hub_main = google_compute_subnetwork.hub_subnet.id

    # Clinical
    clin_int = google_compute_subnetwork.clin_int.id
    clin_ext = google_compute_subnetwork.clin_ext.id

    # Enterprise
    ent_int  = google_compute_subnetwork.ent_int.id

    # Research
    res_int  = google_compute_subnetwork.res_int.id
  }
}

output "subnet_regions" {
  description = "Map of Subnet Regions. Useful for ensuring resources land in the right spot."
  value = {
    hub_main = google_compute_subnetwork.hub_subnet.region
    clin_int = google_compute_subnetwork.clin_int.region
    clin_ext = google_compute_subnetwork.clin_ext.region
    ent_int  = google_compute_subnetwork.ent_int.region
    res_int  = google_compute_subnetwork.res_int.region
  }
}