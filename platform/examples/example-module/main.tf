# XOSS Organizations Administrative IAM Users
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_iam_user" "iam_users" {
  count = length(var.administrative_users)
  name  = var.administrative_users[count.index]
}

# XOSS Organizations Administrative IAM Groups
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_iam_group" "administrative_group" {
  name = var.administrative_group
}

# XOSS Organizations Administrative IAM Group Membership
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_iam_group_membership" "administrative_group_membership" {
  name  = var.group_membership_name
  count = length(var.administrative_users)
  users = [
    aws_iam_user.iam_users[0].name,
    aws_iam_user.iam_users[1].name,
  ]
  group = aws_iam_group.administrative_group.name
}

resource "aws_iam_group_policy_attachment" "iam_group_policy" {
  group      = aws_iam_group.administrative_group.id
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# XOSS Organizations Administrative Create IAM Users Keys
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_iam_access_key" "access_key" {
  count = length(var.administrative_users)
  user  = aws_iam_user.iam_users[count.index].name
}
