# terraform-aws-s3-bucket

Terraform module for AWS S3 buckets with best practices built-in. Features versioning, encryption, lifecycle policies, and website hosting while enforcing security standards by default. Production-ready with minimal configuration yet highly customizable for all S3 use cases.

## Repository Structure

```markdown
terraform-aws-s3-bucket/
├── README.md                       # Documentation
├── main.tf                         # Main module code
├── variables.tf                    # Input variables
├── outputs.tf                      # Output values
├── versions.tf                     # Required providers and versions
├── examples/
│   ├── complete/                   # Complete usage example
│   │   ├── main.tf
│   │   ├── outputs.tf 
│   │   ├── variables.tf
│   │   └── terraform.tfvars.example
│   └── basic/                      # Minimal usage example
│       ├── main.tf
│       └── outputs.tf
├── test/                           # Automated tests
│   └── terraform_aws_s3_bucket_test.go
├── .github/
│   └── workflows/
│       ├── terraform-validate.yml  # Validate Terraform configurations
│       └── terraform-docs.yml      # Auto-generate documentation
├── .gitignore
├── .pre-commit-config.yaml         # Pre-commit hooks
└── LICENSE
```

## Usage

```hcl
module "s3_bucket" {
  source = "github.com/your-org/terraform-aws-s3-bucket"

  bucket_name             = "my-example-bucket"
  environment             = "dev"
  
  # Optional configurations with sensible defaults
  versioning_enabled      = true
  encryption_enabled      = true
  access_logging_enabled  = false
  website_hosting_enabled = false
  
  tags = {
    Owner       = "DevOps Team"
    Project     = "Infrastructure"
    Environment = "Development"
  }
}
```

## Features

- ✅ Server-side encryption (SSE-S3 or KMS)
- ✅ Versioning with lifecycle rules
- ✅ Access control and bucket policies
- ✅ Logging configuration
- ✅ Static website hosting
- ✅ CORS configuration
- ✅ Object lifecycle management
- ✅ Cross-region replication
- ✅ Object lock for compliance

## Examples

### Basic S3 Bucket

```hcl
module "basic_s3_bucket" {
  source      = "github.com/your-org/terraform-aws-s3-bucket"
  bucket_name = "my-basic-bucket"
  environment = "dev"
}
```

### Website Hosting

```hcl
module "website_s3_bucket" {
  source                 = "github.com/your-org/terraform-aws-s3-bucket"
  bucket_name            = "my-website-bucket"
  environment            = "prod"
  website_hosting_enabled = true
  website_index_document = "index.html"
  website_error_document = "error.html"
}
```

### Secure Bucket with KMS Encryption

```hcl
module "secure_s3_bucket" {
  source                      = "github.com/your-org/terraform-aws-s3-bucket"
  bucket_name                 = "my-secure-bucket"
  environment                 = "prod"
  encryption_enabled          = true
  encryption_type             = "KMS"
  kms_key_arn                 = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-ab12-cd34-ef56-abcdef123456"
  block_public_acls           = true
  block_public_policy         = true
  ignore_public_acls          = true
  restrict_public_buckets     = true
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| bucket_name | Name of the S3 bucket | `string` | n/a | yes |
| environment | Environment where the bucket is deployed | `string` | n/a | yes |
| versioning_enabled | Enable versioning on the bucket | `bool` | `true` | no |
| encryption_enabled | Enable server-side encryption | `bool` | `true` | no |
| encryption_type | Type of encryption (S3 or KMS) | `string` | `"S3"` | no |
| kms_key_arn | ARN of KMS key for encryption | `string` | `null` | no |
| access_logging_enabled | Enable access logging | `bool` | `false` | no |
| website_hosting_enabled | Enable static website hosting | `bool` | `false` | no |
| website_index_document | Index document for website | `string` | `"index.html"` | no |
| website_error_document | Error document for website | `string` | `"error.html"` | no |
| tags | Tags to assign to the bucket | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The domain name of the bucket |
| bucket_regional_domain_name | The regional domain name of the bucket |
| bucket_website_endpoint | The website endpoint of the bucket |
| bucket_website_domain | The domain of the website endpoint |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| aws | >= 4.0.0 |

## License

MIT Licensed. See LICENSE for full details.