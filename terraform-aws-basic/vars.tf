variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

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
    default = "./mykey"
}

variable "PATH_PUBLIC_KEY" {
    default = "./mykey.pub"
}

variable "USERNAME" {
    default = "ubuntu"
}