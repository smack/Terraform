variable "aws_region" {
  description = "Region for the instance"
  default = "ap-south-1"
}

variable "ami" {
  description = "Ubuntu AMI"
  default = "ami-04ea996e7a3e7ad6b"
}

variable "instance_type" {
  description = "Instance Size"
  default = "t2.micro"
}

variable "key_path" {
  description = "Key path for SSHing into EC2"
  default  = "./ssh/aspendevops.pem"
}

variable "key_name" {
  description = "Key name for SSHing into EC2"
  default = "aspendevops"
}

