

variable "metadata_name_deploy"{
  type = string
  default = "nginx-deployment"
}

variable "replicas_number"{
  type = number
  default = 3
}

variable "label_pod"{
  type = string
  default = "nginx_label"
}

variable "metadata_name_serv"{
  type = string
  default = "nginx-service"
}