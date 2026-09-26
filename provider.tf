
variable "secret-path" {default = "/home/kcroot/terraform/secret-gcp"
  
}
provider "google" {
    project = "internal-stuff-corp"
    region = "europe-southwest1-a"
    credentials = "${file("${var.secret-path}/secret.json")}"
}