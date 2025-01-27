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

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags  = {
        Name = "dg-igw"
    }
}

######## 탄력적 ip & Nat Gateway

# resource "aws_eip" "nat" {
#     domain = "vpc"  # vpc = true가 변경됨

#     lifecycle {
#         create_before_destroy = true
#     }
# }

# resource "aws_nat_gateway" "nat_gateway" {
#     allocation_id = aws_eip.nat.id

#     # private 서브넷이 아니라 public subent을 연결해야함 
#     # 이유는 nat-gateway는 퍼블릭 서브넷에 생성되기때문임
#     subnet_id = aws_subnet.public_subnet.id

#     tags = {
#         Name = "NAT-GW"
#     }
# }


resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    # 블락안에 라우트 형태, inner rule, 라우트 테이블과 gateway를 연결하는걸 rule이라고 표현
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "rt-public"
    }
}

resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public.id
  
}


resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "rt-private"
    }
}

resource "aws_route_table_association" "private_association" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private.id

}
## rule은 바깥으로 빼는게 best practice인거 같음
#### out rule 생성 
# resource "aws_route" "private_nat" {
#   route_table_id              = aws_route_table.private.id
#   destination_cidr_block      = "0.0.0.0/0"
#   nat_gateway_id              = aws_nat_gateway.nat_gateway.id
# }


# endpoint는 aws 서비스 간 프라이빗 연결, 내부 통신을 함
resource "aws_vpc_endpoint" "s3" {
    vpc_id = aws_vpc.main.id
    service_name = "com.amazonaws.ap-northeast-2.s3"
    tags = {
      Environment = "test"
    }
}

# endpoint는 private 서브넷과  연결 
resource "aws_vpc_endpoint_route_table_association" "private_s3" {
    vpc_endpoint_id = aws_vpc_endpoint.s3.id
    route_table_id = aws_route_table.private.id
  
}