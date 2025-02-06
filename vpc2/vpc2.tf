
# vpc 생성
resource "aws_vpc" "dg-vpc2" {
    cidr_block = var.vpc2_cidr
    enable_dns_support = true # vpc 내에서 dns 조회 기능 활성화
    enable_dns_hostnames = true # vpc 내에 생성되는 인스턴스에 dns 호스트 네임 할당 활성화

    tags = {
        Name = var.vpc2_name
    }
  
}

# public subnet 생성

resource "aws_subnet" "dg-public-sb2" {
  vpc_id = aws_vpc.dg-vpc2.id
  cidr_block = var.public_subnet_cidr

  availability_zone = var.public_availability_zone

  tags = {
    Name  = var.public_subnet_name
  }
}

resource "aws_subnet" "dg-private-sb2" {

    vpc_id = aws_vpc.dg-vpc2.id
    cidr_block = var.private_subnet_cidr
    availability_zone = var.private_availability_zone

    tags = {
        Name = var.private_subnet_name
    }
  
}

# igw 생성
resource "aws_internet_gateway" "dg-igw2" {
    vpc_id = aws_vpc.dg-vpc2.id
    
    tags = {
        Name = var.igw_name
    }
}

# Route table 생성
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.dg-vpc2.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dg-igw2.id
    }
    
    tags = {
      Name = var.public_route_table_name
    }
}

# 퍼블릭 서브넷과 라우트 테이블 연결 
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.dg-public-sb2.id
    route_table_id = aws_route_table.public-rt.id
  
}

# 프라이빗 라우트 테이블
resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.dg-vpc2.id
    tags = {
        Name = var.private_route_table_name
    }
  
}

# 프라이빗 서브넷과 라우트 테이블 연결
resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.dg-private-sb2.id
    route_table_id = aws_route_table.private-rt.id
}

