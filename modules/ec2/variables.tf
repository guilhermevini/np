variable "image_id" {
  default = "ami-0cda50904327414a9"
}

variable "key" {
  default = "lab_cloud_key_ohio"
}

variable "web_sg" {
  default = ""
}

variable "balance_sg" {
  default = ""
}

variable "vpc" {
  default = ""
}


variable "subnet_public" {
  default = {
    "2a"     = ""
    "2b"    = ""
  }
}

variable "subnet_private" {
  default = {
    "2a"    = "subnet-080a5a35961e0add6"
    "2b" = "subnet-00e437117e46c4ae7"
  }
}

variable "sub_pub" {
  type    = "list"
  default = [""]
}

variable "sub_priv" {
  type    = "list"
  default = [""]
}