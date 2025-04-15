provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source = "../.."

  bucket_name = "my-basic-example-bucket"
  
  tags = {
    Environment = "dev"
    Project     = "terraform-examples"
  }
}
