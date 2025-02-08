terraform {
  backend "s3" {
    bucket = "dg-tf-state-pr"
    key = "dg-terraform/ec2m/terraform.state"
    region = "ap-northeast-2"
    encrypt = true
    dynamodb_table = "terraform-lock"
    
  }
}