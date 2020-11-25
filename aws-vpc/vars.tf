variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-west-2 = "ami-008b09448b998a562"
  }
}

variable "PATH_PRIVATE_KEY" {
  default = "/home/erdem/.ssh/id_rsa"
}

variable "PATH_PUBLIC_KEY" {
  default = "/home/erdem/.ssh/id_rsa.pub"
}

variable "USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
