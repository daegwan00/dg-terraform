variable "vpc2_cidr" {
    description = "vpc cidr 대역"
    type = string
}
variable "public_subnet_cidr" {
    description = "pb-subnet 대역"
    type = string
}
variable "private_subnet_cidr" {
    description = "pv-subnet 대역"
    type = string
}

variable "public_availability_zone" {
    description = "pb-subnet zone"
    type = string
}

variable "private_availability_zone" {
    description = "pv-subent zone"
    type = string
}

variable "vpc2_name" {
    description = "vpc 태그 이름"
    type = string
}

variable "public_subnet_name" {
    description = "pb-sb 태그 이름"
    type = string
}

variable "private_subnet_name" {
    description = "pv-sb 태그 이름"
    type = string
}

variable "public_route_table_name" {
    description = "pb-rt 태그 이름"
    type = string
}

variable "private_route_table_name" {
    description = "pv-rt 태그 이름"
    type = string
}

variable "igw_name" {
    description = "igw 태그 이름"
    type = string
}