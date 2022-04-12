locals {
  vpc_id    = "vpc-08cdb97c2e3155291"
  subnet_id = "subnet-064934984e72501d2"
}

resource "aws_instance" "web" {
  ami           = "ami-07315f74f3fa6a5a3"
  instance_type = "t2.medium"
  key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = "${local.subnet_id}"
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "Jenkins-VM"
  }
    connection {
      host = self.public_ip
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/aditia/aws/adit.pem")}"
    }
}   