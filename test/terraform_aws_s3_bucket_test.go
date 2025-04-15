package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestS3BucketModule(t *testing.T) {
	t.Parallel()

	// Arrange
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/basic",
	})

	// Act
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Assert
	bucketID := terraform.Output(t, terraformOptions, "bucket_id")
	bucketARN := terraform.Output(t, terraformOptions, "bucket_arn")

	assert.NotEmpty(t, bucketID)
	assert.NotEmpty(t, bucketARN)
	assert.Contains(t, bucketARN, "arn:aws:s3")
}