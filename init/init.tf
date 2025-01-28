provider "aws" {
	region = "ap-northeast-2"
	version = "~> 4.0"
}

resource "aws_s3_bucket" "tfsate" {
	bucket = "dg-tf-state-pr"
	
	versioning {
		enabled = true
	}
}


resource "aws_dynamodb_table" "terraform_state_lock"{
	name = "terraform-lock"
	hash_key = "LockID"
	billing_mode = "PAY_PER_REQUEST"

	attribute {
		name = "LockID"
		type = "S"
	}
}




