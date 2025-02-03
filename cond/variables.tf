variable "aws_access_key" {
    type = string
    }
variable "aws_secret_key" {
    type = string
    }

variable "usrsList" {
  type = list(string)
}

variable "condition" {
  type = bool
}

variable "port" {
  type = list(number)
}
