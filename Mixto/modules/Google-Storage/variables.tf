# *** YOUR CODE HERE ***
# Definir 3 variables
# * gcp_username inicializada con el nombre de usuario en GCP
variable "gcp-username" {
  description = "GCP user name"
  default     = "emp718"
}
# * gcp_project inicializada con el nombre del proyecto en GCP
variable "gcp-project" {
  description = "GCP project"
  default     = "My First Project"
}
# * gcp_bucket_name inicializada con el nombre del bucket a crear en Google Storage
variable "gcp-bucket" {
  description = "GCP bucket"
  default     = "bucket-emp718"
}
# **********************

