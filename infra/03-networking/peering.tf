# --- Hub <-> Clinical ---
resource "google_compute_network_peering" "hub_to_clin" {
  name         = "peer-hub-to-clin"
  network      = google_compute_network.hub_vpc.self_link
  peer_network = google_compute_network.clin_vpc.self_link
}
resource "google_compute_network_peering" "clin_to_hub" {
  name         = "peer-clin-to-hub"
  network      = google_compute_network.clin_vpc.self_link
  peer_network = google_compute_network.hub_vpc.self_link
}

# --- Hub <-> Enterprise ---
resource "google_compute_network_peering" "hub_to_ent" {
  name         = "peer-hub-to-ent"
  network      = google_compute_network.hub_vpc.self_link
  peer_network = google_compute_network.ent_vpc.self_link
}
resource "google_compute_network_peering" "ent_to_hub" {
  name         = "peer-ent-to-hub"
  network      = google_compute_network.ent_vpc.self_link
  peer_network = google_compute_network.hub_vpc.self_link
}

# --- Hub <-> Research ---
resource "google_compute_network_peering" "hub_to_res" {
  name         = "peer-hub-to-res"
  network      = google_compute_network.hub_vpc.self_link
  peer_network = google_compute_network.res_vpc.self_link
}
resource "google_compute_network_peering" "res_to_hub" {
  name         = "peer-res-to-hub"
  network      = google_compute_network.res_vpc.self_link
  peer_network = google_compute_network.hub_vpc.self_link
}