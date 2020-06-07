

variable "instance_count" {
  default = "2"
}

variable "instance_tags" {
  type = "list"
  default = ["DEMOWAP0001", "DEMWOWAP0002"]
}