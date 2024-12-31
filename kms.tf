# Create a new KMS key for SSM parameters
resource "aws_kms_key" "ssm_key" {
  description             = "KMS key for encrypting SSM parameters"
  enable_key_rotation     = true
  deletion_window_in_days = 30
}

# Create an alias for the KMS key
resource "aws_kms_alias" "ssm_key_alias" {
  name          = "alias/git-crypt-ssm-key"
  target_key_id = aws_kms_key.ssm_key.id
}
