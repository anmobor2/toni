terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "project-intely/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}