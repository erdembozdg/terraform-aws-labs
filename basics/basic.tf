variable "my_string" {
    type    = string
    default = "helloworld"
}

variable "my_number" {
    type    = number
    default = 12
}

variable "my_bool" {
    type    = bool
    default = true
}

variable "my_map" {
    type       = map(string)
    default    = {
        mykey  = "myvalue"
    }
}

variable "my_set" {
    type       = set(number)
    default    = {1, 2, 3}
}

variable "my_tuble" {
    type       = tuble(number)
    default    = [1, "string", false]
}

variable "my_list" {
    type    = list(string)
    default = ["erdem", "bozdag"]
}

variable "my_object" {
    type    = object(string)
    default = {
        firstname = "erdem"
        id        = 10
    }
}
