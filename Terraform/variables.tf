variable "publickeypath" {
  type    = string
  default = " "
}
variable "region" {
  default = "europe-west1"
}
variable "zone" {
  default = "europe-west1-b"
}
variable "project" {
  default = "gentle-shell-371709"
}
variable "image" {
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}
variable "gcp_ssh_user" {
  default = "root"
}
#next SQL variables
variable "database" {
    type = string
    description = "SQL Database Name"
    default = " "
}

variable "db_user" {
    type = string
    description = "SQL Database User Name"
    default = " "
}

variable "db_user_pass" {
    type = string
    description = "Passowrd for SQL Database User"
    default = " "
}