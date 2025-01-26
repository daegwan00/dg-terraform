resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "dg-vpc" # 태그 name으로 구별할 수 있음
    }
}

# subent create, vpc에 의존성임

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id  # main이라는 데모라는걸 참조
    cidr_block = "10.0.1.0/24" # cidr 값을 private 과 다르게

    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "dg-public-subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.main.id  # main이라는 데모라는걸 참조
    cidr_block = "10.0.2.0/24" # cidr 값을 public 과 다르게

    availability_zone = "ap-northeast-2b"

    tags = {
        Name = "dg-private_subnet"
    }
}
