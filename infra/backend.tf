terraform {
  backend "s3" {
    bucket  = "keisukemitsumune-tf-state"
    key     = "bi-trial/terraform.tfstate"
    encrypt = true
    region  = "us-east-1"
    profile = "default"
  }
}