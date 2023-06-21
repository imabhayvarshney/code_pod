variable "region" {
  default     = "us-east-1"
}

variable "name" {
  type        = string
  default     = "morning-ssh-http"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-09d56f8956ab235b3"
}

variable instance_type{
  default = "t2.micro"
}

variable az{
  default = "us-east-1a"
}