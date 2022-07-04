variable "vpc1_cidr" {
  type        = string
  description = "cidr block for vpc 1"
}
variable "vpc2_cidr" {
  type        = string
  description = "cidr block for vpc 2"
}



variable "sub1_vpc1" {
  type        = string
  description = "cidr block for subnet 1 in vpc 1"
}
variable "sub1_vpc2" {
  type        = string
  description = "cidr block for subnet 1 in vpc 2"
}


variable "access_key1" {
  type        = string
  description = "access key for aws provider"
}

variable "secret_key1" {
  type        = string
  description = "secret access key for aws provider"
}


variable "ami_ec2" {
  type        = string
  description = "ami for ec2 instance config"
}

variable "kp" {
  type        = string
  description = "key pair name from console"
}

variable "all_cidr" {
  type = string
  description = "0.0.0.0/0 cidr"
}