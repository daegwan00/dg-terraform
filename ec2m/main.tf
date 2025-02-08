module "ec2-instance" {
    source = "./modules/ec2"
    ami = var.instance_ami
    instance_type = var.instance_type
    instance_name = var.instance_name
    subnet_id = data.terraform_remote_state.vpc2.outputs.public_subnet
    

}