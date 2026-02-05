# Database credentials from Secrets Manager

# Retrieve the latest version of the secret
data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = var.secret_id
}

# Parse secret JSON for easier referencing
locals {
  secrets = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)
}
