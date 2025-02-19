output "vpc_id" {
    description = "vpc_id"
    value = aws_vpc.dg-vpc2.id
}

output "public_subnet" {
    description = "public_subnet"
    value = aws_subnet.dg-public-sb2.id
}

output "private_subnet" {
    description = "private_subnet"
    value = aws_subnet.dg-private-sb2.id
}

output "vpc2_name" {
    description = "using vpc2 tags name for ec2"
    value = aws_vpc.dg-vpc2.tags
}
