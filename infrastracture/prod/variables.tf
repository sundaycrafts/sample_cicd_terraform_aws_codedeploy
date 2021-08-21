variable "vpc_id" {
  type = string
}

variable "azs" {
  description = "availability zones"

  type = list(string)
}
