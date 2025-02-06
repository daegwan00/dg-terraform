terraform {
    backend "s3"{
      bucket         = "dg-tf-state-pr" # s3 bucket �̸�
      key            = "dg-terraform/vpc2/terraform.tfstate" # s3에 dg-terraform안에/vpc2/안에/state를 넣겠다
      region         = "ap-northeast-2"  
      encrypt        = true
      dynamodb_table = "terraform-lock"
    }
}