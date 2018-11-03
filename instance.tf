resource "aws_instance" "newname"  {
	ami = "${lookup(var.amis, var.region)}"
        instance_type = "${var.instancetype}"
	key_name = "terraformjenkins"
        associate_public_ip_address = "true"
        count = "${var.count}"
}
