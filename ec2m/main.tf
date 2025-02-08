module "ec2-instance" {
    source = "./modules/ec2"
    ami =  "ami-037f2fa59e7cfbbbb"
    service_name = "dg-practice-service" 
    instance_type = "t2.micro"
    key_name = aws_key_pair.dg-key.key_name

    subnet_id = data.terraform_remote_state.vpc2.outputs.public_subnet
    vpc2_id = data.terraform_remote_state.vpc2.outputs.vpc_id
    vpc2_name = data.terraform_remote_state.vpc2.outputs.vpc2_name
    public_subnet = data.terraform_remote_state.vpc2.outputs.public_subnet
    private_subnet = data.terraform_remote_state.vpc2.outputs.private_subnet
    

}