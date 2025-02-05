
# vpc 생성
resource "aws_vpc" "dg-vpc2" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true # vpc 내에서 dns 조회 기능 활성화
    enable_dns_hostnames = true # vpc 내에 생성되는 인스턴스에 dns 호스트 네임 할당 활성화

    tags = {
        Name = "ap-dg-vpc2"
    }
  
}

# public subnet 생성

resource "aws_subnet" "dg-public-sb2" {
  vpc_id = aws_vpc.dg-vpc2.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name  = "dg-public-sb2"
  }
}

resource "aws_subnet" "dg-private-sb2" {

    vpc_id = aws_vpc.dg-vpc2.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-2b"

    tags = {
        Name = "dg-private-sb2"
    }
  
}

# igw 생성
resource "aws_internet_gateway" "dg-igw2" {
    vpc_id = aws_vpc.dg-vpc2.id
    
    tags = {
        Name = "dg-igw2"
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
      Name = "dg-public-rt"
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
        Name = "dg-private-rt"
    }
  
}

# 프라이빗 서브넷과 라우트 테이블 연결
resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.dg-private-sb2.id
    route_table_id = aws_route_table.private-rt.id
}

