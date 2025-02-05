data "terraform_remote_state" "vpc2" {
    backend = "local" # 로컬 백엔드 사용
    config = {
      path = "../vpc2/terraform.tfstate"
    }
  
}