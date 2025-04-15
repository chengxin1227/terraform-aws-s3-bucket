provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source = "../.."

  bucket_name = "my-complete-example-bucket"
  
  tags = {
    Environment = "dev"
    Project     = "terraform-examples"
  }
  
  versioning_enabled = true
  server_side_encryption = true
  
  lifecycle_rules = [
    {
      id      = "transition-to-ia"
      enabled = true
      prefix  = "logs/"
      transition_days = 30
      transition_storage_class = "STANDARD_IA"
    },
    {
      id      = "expire-old-logs"
      enabled = true
      prefix  = "logs/"
      expiration_days = 90
    },
    {
      id      = "archive-data"
      enabled = true
      prefix  = "archive/"
      transition_days = 90
      transition_storage_class = "GLACIER"
    }
  ]
}