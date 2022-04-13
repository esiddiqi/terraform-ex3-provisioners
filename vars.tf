
variable REGION{
    default = "us-east-2"

}

variable ZONE1{
  default = "us-east-2a"
}

variable AMIS {
  type = map
  default = {
    us-east-2 = "ami-064ff912f78e3e561"
    us-east-1 = "ami-0c02fb55956c7d316"
  }
}
