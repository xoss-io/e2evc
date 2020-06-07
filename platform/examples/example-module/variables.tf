# XOSS Organizations Administrative Users Variables
# ----------------------------------------------------------------------------------------------------------------------

variable "administrative_users" {
  description = "The list of administrative users that should be created"
  type        = list(string)
}

variable "administrative_group" {
  description = "The name of the administrative group that should be created"
  type        = string
}

variable "group_membership_name" {
  description = "The users that should be added to the group"
  type        = string
}