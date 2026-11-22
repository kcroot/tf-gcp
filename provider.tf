
variable "secret-path" {default = "/home/kcroot/terraform/secret-gcp"
  
}
provider "google" {
    project = "app-stage"
    region = "europe-southwest1-a"
    credentials = "${file("${var.secret-path}/secret.json")}"
}