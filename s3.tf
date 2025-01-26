resource "aws_s3_bucket" "test" {  # 리소스 뒤에 바로 오는건, aws에 실제 있는 서비스 이름, 뒤에는 데모 (유형)
    bucket = "dg-pr-bucket"  # 버킷이름은 고유해야함
}