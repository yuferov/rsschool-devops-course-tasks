variable "basename" {
  description = "Prefix used for all resources names"
  default     = "rsschool"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "net_conf" {
  type = map(any)
  default = {
    pub-sub-1 = {
      az        = "us-east-1a"
      cidr      = "10.0.0.0/20"
      is_public = true
    }
    pub-sub-2 = {
      az        = "us-east-1b"
      cidr      = "10.0.16.0/20"
      is_public = true
    }
    priv-sub-1 = {
      az        = "us-east-1a"
      cidr      = "10.0.128.0/20"
      is_public = false
    }
    priv-sub-2 = {
      az        = "us-east-1b"
      cidr      = "10.0.144.0/20"
      is_public = false
    }
  }
}
