variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "production" {
  default = "blue"
}

variable "project" {
  description = "The project name to use for unique resource naming"
  default     = "terraform-series-hien"
  type        = string
}

variable "principal_arns" {
  description = "A list of principal arns allowed to assume the IAM role"
  default     = null
  type        = list(string)
}
