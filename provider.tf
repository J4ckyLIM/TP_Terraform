terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.29.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}


/* ------ provider declaration --------------*/
 
provider "google" {
 
credentials = "${file("./serviceAccount.json")}" // FOR TEST PURPOSE THE SERVICE ACCOUNT IS VISIBLE IN THE PROJECT
 
project = "tp-infra-terraform"
 
region = "europe-west2-a"
 
}

provider "kubernetes" {
  host = data.terraform_remote_state.gke.outputs.kubernetes_cluster_host

  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
}