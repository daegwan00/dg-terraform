
# remote_state.tf 파일에서 가져온 vpc의 퍼블릭 서브넷 id를 참조하여 인스턴스 생성
resource "aws_instance" "dg-ec2" {
  ami = var.instance_ami
  instance_type = var.instance_type

  subnet_id = data.terraform_remote_state.vpc2.outputs.public_subnet

  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}