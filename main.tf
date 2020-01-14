provider "aws" {
  region  = "us-east-2"
  access_key = "AKIAZRLK7LSZ3DO4RYHK"
  secret_key = "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"
}

/*------------------- [ ENVIRONMENTS ] ---------------------*/
module "infra_lab" {
  source = "./environments/lab/"
}

terraform {
  required_version = "= 0.11.14"

  backend "s3" {
    bucket  = "neon-lab-terraform"
    key     = "terraform-neon-lab.tfstate"
    region  = "us-east-2"
    encrypt = false
  }
}