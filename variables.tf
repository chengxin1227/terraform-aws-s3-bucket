variable "bucket_name" {
  description = "Name of the S3 bucket. If not provided, a unique name will be generated."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "Boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error."
  type        = bool
  default     = false
}

variable "acl" {
  description = "The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write."
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Boolean specifying whether versioning is enabled."
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules to configure."
  type = list(object({
    id                                     = string
    enabled                                = bool
    prefix                                 = optional(string)
    expiration_days                        = optional(number)
    noncurrent_version_expiration_days     = optional(number)
    transition_days                        = optional(number)
    transition_storage_class               = optional(string)
    noncurrent_version_transition_days     = optional(number)
    noncurrent_version_transition_storage_class = optional(string)
  }))
  default = []
}

variable "server_side_encryption" {
  description = "Enable server-side encryption."
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "The ARN of the KMS key to use for encryption. If not specified, the default AWS managed key will be used."
  type        = string
  default     = null
}