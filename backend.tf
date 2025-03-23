terraform {
  backend "s3" {
    bucket = "terraform-23032025"
    key    = "terraform.tfstate"   
    region = "us-east-2"
    dynamodb_table = "DynamoDB23032025" 
  }
}