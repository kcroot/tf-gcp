resource "google_compute_instance" "www-srv" {
  boot_disk {
    device_name = "www-srv"
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  description = ""
  instance_encryption_key {
  }
  key_revocation_action_type = "NONE"
  machine_type               = "e2-micro"
  name                       = "www-srv"
  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
    stack_type         = "IPV4_ONLY"
    subnetwork         = "projects/app-stage-515313/regions/europe-central2/subnetworks/default"
    subnetwork_project = "app-stage-515313"
  }
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
  service_account {
    email  = "kcroot@app-stage-515313.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  tags = []
  zone = "europe-central2-a"
}

module "ops_agent_policy" {
  source          = "github.com/terraform-google-modules/terraform-google-cloud-operations/modules/ops-agent-policy"
  project         = "app-stage-515313"
  zone            = "europe-central2-a"
  assignment_id   = "goog-ops-agent-v2-template-1-7-0-europe-central2-a"
  agents_rule = {
    package_state = "installed"
    version = "latest"
  }
  instance_filter = {
    all = false
    inclusion_labels = [{
      labels = {
        goog-ops-agent-policy = "v2-template-1-7-0"
      }
    }]
  }
}
