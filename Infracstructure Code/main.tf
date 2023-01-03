terraform {
  required_version = ">=0.12.13"
  backend "s3" {
    bucket         = "test-demo-terraform-tfstate"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-locks"
    encrypt        = true
  }
}


module "cloud-resume" {
  source                      = "./modules/cloud-resume"
  bucket-name                 = "cloud-resume-12412"

}

