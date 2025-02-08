variable "zone_id" {
  type = string
}

variable "repository_uri" {
  type = string
}

variable "repository_dir" {
  type = string
}

variable "up_command" {
  type = string
}

variable "subdomain" {
  type = string
}

variable "allowed_ips" {
  type = list(string)
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "static-subdomain" {
  type = string
}
variable "static-cname" {
  type = string
}