output "ec2_instance_instance_profile_role_name" {
  description = "value"
  value       = aws_iam_instance_profile.s3_full_access_instance_profile.name
}