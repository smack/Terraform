# launch new instance
resource "aws_instance" "w" {
   ami  = "${var.ami}"
   instance_type = "${var.instance_type}"
   security_groups = [  "BOB" ]
   associate_public_ip_address = true
   source_dest_check = false
   key_name = "terraform_ec2_key"
   provisioner "local-exec" {
     command = "echo ${aws_instance.w.public_ip} >> /etc/ansible/hosts"}

  tags {
    Name = "BOB"
  }
}
