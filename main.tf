resource "google_compute_instance" "test" {
  name = ""
  machine_type = ""
  zone = ""

  boot_disk {
    initialize_params {
      image = ""
    }
  }
network_interface {
  network = "default"
}
service_account {
  scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}
}