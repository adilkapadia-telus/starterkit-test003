
terraform {
  # The modules used in this example have been updated with 0.12 syntax, additionally we depend on a bug fixed in
  # version 0.12.7.
  required_version = ">= 0.12.7"
}

provider "google-beta" {
  version = "~> 2.10"  
}

resource "google_cloudbuild_trigger" "sample-trigger" {
  provider    = "google-beta"
  description = "GitHub Repository Trigger ${var.github_owner}/${var.github_repository} (${var.branch_name})"
  name= "${var.trigger_name}"

  github {
    owner = var.github_owner
    name  = var.github_repository
    push {
      branch = var.branch_name
    }
  }
 
  filename = "${var.cloud_build_file}"
}
