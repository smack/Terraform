resource "aws_key_pair" "terraform_ec2_key" {
  key_name = "terraform_ec2_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
