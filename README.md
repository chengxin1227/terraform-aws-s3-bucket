ports server-side encryption (SSE-S3 or KMS)
- Configurable lifecycle rules
- Configurable access control

## Usage

```hcl
module "s3_bucket" {
  source = "git::https://github.com/your-org/terraform-aws-s3-bucket.git"

  bucket_name        = "my-example-bucket"
  tags               = {
    Environment = "dev"
    Project     = "example"
  }
  versioning_enabled = true
  
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
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| bucket_name | Name of the S3 bucket | `string` | `null` | no |
| bucket_prefix | Creates a unique bucket name beginning with the specified prefix | `string` | `null` | no |
| tags | A mapping of tags to assign to the bucket | `map(string)` | `{}` | no |
| force_destroy | Boolean that indicates whether to delete all objects in the bucket when destroying | `bool` | `false` | no |
| acl | The canned ACL to apply | `string` | `"private"` | no |
| versioning_enabled | Boolean specifying whether versioning is enabled | `bool` | `false` | no |
| lifecycle_rules | List of lifecycle rules to configure | `list(object)` | `[]` | no |
| server_side_encryption | Enable server-side encryption | `bool` | `true` | no |
| kms_key_arn | KMS key ARN to use for encryption | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket region-specific domain name |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| aws | >= 4.0.0, < 6.0.0 |

## License

MIT