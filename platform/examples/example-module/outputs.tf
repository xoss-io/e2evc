# XOSS Organizations Administrative Users  Outputs
# ----------------------------------------------------------------------------------------------------------------------

output "keys" {
  value = aws_iam_access_key.access_key
}

output "group_name" {
  value = aws_iam_group.administrative_group.name
}