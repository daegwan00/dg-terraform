terraform {
    backend "s3" { # ���Ǵ� 
      bucket         = "dg-tf-state-pr" # s3 bucket �̸�
      key            = "dg-terraform/ec2/terraform.tfstate" # 
      region         = "ap-northeast-2"  
      encrypt        = true
      dynamodb_table = "terraform-lock"
    }
}
