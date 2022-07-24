# Variables
 
#####################################################################
 
variable "username" { default = "root" }
 
variable "password" { default = "root1234567891011" }
 
#####################################################################
 
# Modules
 
#####################################################################
 
module "gke_cluster" {
 
source = "./gke"

}
 
module "k8s" {
 
source = "./nginx"
 
host = "${module.gke_cluster.host}"
 
username = "${var.username}"
 
password = "${var.password}"
 
client_certificate = "${module.gke_cluster.client_certificate}"
 
client_key = "${module.gke_cluster.client_key}"
 
cluster_ca_certificate = "${module.gke_cluster.cluster_ca_certificate}"
 
}