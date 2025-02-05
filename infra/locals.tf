locals {
  general = {
    service_name = "bi-trial"
    region       = "us-east-1"
  }
  ec2 = {
    ami           = "ami-0c614dee691cbbf37"
    instance_type = "t3.medium" # 4GB / 0.0418 USD/h
    #instance_type = "t3.small" # 2GB / 0.0209 USD/h
    #instance_type = "t3.micro"  # 1GB / 0.0104 USD/h
    repository_dir = "bi-trial"
    up_command     = "make upb-v1"
  }
}