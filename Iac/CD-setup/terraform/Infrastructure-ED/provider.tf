# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.project
  region  = var.region
}

# https://www.terraform.io/language/settings/backends/gcs

#bucket

# terraform {
#   backend "gcs" {
#     bucket = "antonputra-tf-state-staging"
#     prefix = "terraform/state"
#   }
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 4.0"
#     }
#   }
# }