variable "zone_id" {
  type = string
}

variable "repository_uri" {
  type = string
}

variable "repository_dir" {
  type = string
}

variable "subdomain" {
  type = string
}

variable "allowed_ips" {
  type = list(string)
}