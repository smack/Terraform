# launch new instance
resource "aws_instance" "w" {
   ami  = "${var.ami}"
   instance_type = "${var.instance_type}"
   security_groups = [ "sg" ]
   associate_public_ip_address = true
   source_dest_check = false
   key_name = "${var.key_name}"

  tags {
    Name = "MAC"
  }
}

