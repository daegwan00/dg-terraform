resource "aws_security_group" "dg-sg" {
    name = var.service_name
    description = "practice security group for ec2"
    vpc_id = var.vpc2_id


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "dg-ec2-public" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.public_subnet
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.dg-sg.id]
    associate_public_ip_address = true # 퍼블릭 ip 자동 할당 옵션
    tags = {
        Name = var.service_name
    }

}