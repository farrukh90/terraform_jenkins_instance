variable  "region" {}
variable  "instancetype" {}
variable  "count" {}



variable "amis" {
  type = "map" 

  default = {
    eu-west-1 = "ami-6e28b517"
    us-east-1 = "ami-4bf3d731"
    us-west-2 = "ami-a042f4d8"
  }
}

