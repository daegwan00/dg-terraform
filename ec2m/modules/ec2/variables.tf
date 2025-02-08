variable "ami" {
  description = "EC2 인스턴스 AMI ID"
  type = string
}

variable "instance_type" {
  description = "EC2 인스턴스 타입"
  type = string
}

variable "subnet_id" {
    description = "인스턴스가 생성될 서브넷 ID"
    type = string
  
}



variable "service_name" {}

variable "vpc2_name" {}

variable "public_subnet" {}

variable "private_subnet" {}

variable "vpc2_id" {}

variable "key_name" {}