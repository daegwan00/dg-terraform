data "terraform_remote_state" "vpc2" {
    backend = "s3"
    config = {
      bucket = "dg-tf-state-pr"
      key = "dg-terraform/vpc2/terraform.tfstate"
      region = "ap-northeast-2"
      encrypt = true
      dynamodb_table = "terraform-lock"
    }
  
}