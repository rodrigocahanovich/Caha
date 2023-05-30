variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  type        = map(any)
  default     = {
      Name        = "Cahanovich"
      Projeto     = "Stone"
      Ambiente    = "hmg"
  }
}
variable "instance_name" {
        default = "cahanovich"
}

#variable "ami_id" {
#        default = "ami-01f451f00dae38302"
#}

variable "image_id" {
  type        = string
  default     = "ami-01f451f00dae38302"
}
variable "instance_type" {
  default     = "t3.small"
  description = "Instance type to launch."
}

variable "example_docker_compose" {
    type = string
    default =  <<EOF
version: "3.1"
services:
  mysql:
    image: mysql:5.7
    conatiner_name: mysql_container
EOF
}