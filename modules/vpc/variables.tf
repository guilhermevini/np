variable "range" {
  default = "172.10.0.0/16"
}

variable "subnet_public" {
  default = {
    "2a" = "172.10.0.0/24"
    "2b" = "172.10.2.0/24"
  }
}

variable "subnet_private" {
  default = {
    "2a" = "172.10.1.0/24"
    "2b" = "172.10.3.0/24"
  }
}

variable "zona" { 
    default = "us-east-2"
}

variable "zonas" {
  default = {
    "2a" = "us-east-2a"
    "2b" = "us-east-2b"
  }
}