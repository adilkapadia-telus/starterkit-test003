variable "gke_namespace" {
  type    = string
  default = "{{ cookiecutter.namespace }}"
}

variable "instance_suffix" {
  type    =  string
  default = "db"
}

variable "db_name" {
  type    =  string
  default = "APPDB"
}

variable "db_user" {
  type    =  string
  default = "postgres"
}

variable "db_version" {
  type    =  string
  default = "POSTGRES_13"
}

variable "shared_vpc_network" {
  description = "the host network for the database"
  default = "https://www.googleapis.com/compute/v1/projects/bto-vpc-host-6296f13b/global/networks/bto-vpc-host-network"
}

variable "ksa_name" {
  type    = string
  default = "default"
}

variable "gke_cluster_env" {
  type    = string
  default = "private-np"
}

variable "gsa_roles" {
  type =  list
  description =   "All roles needed for the GCP service account"
  default=  [
    "roles/cloudsql.admin",
    "roles/secretmanager.secretAccessor",
    "roles/secretmanager.viewer"
  ]
}

variable "trigger_name" {
    description     = "Trigger name"
    default         = "{{cookiecutter.application}}-trigger"
}

variable "cloud_build_file" {
    description     = "Name of the build file"
    default         = "cloudbuild.yaml"
}

variable "github_owner" {
    description     = "GitHub account"
    default         = "telus"
}

variable "github_repository" {
    description     = "Name of Github Repo"
    default         = "{{ cookiecutter.githubRepo }}"
}

variable "branch_name" {
    description     = "Name of branch to monitor"
    default         = "main"
}
