variable "aws_region" {
    description = "AWS 리전"
    type = string
}

variable "instance_type" {
    description = "EC2 인스턴스 타입"
    type = string
}

variable "instance_ami" {
    description = "AMI ID"
    type = string
}


variable "instance_name" {
    description = "인스턴스 NAME"
    type = string
}