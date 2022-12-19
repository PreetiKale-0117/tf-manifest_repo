resource "aws_instance" "web_sev" {
  ami = var.appser_imageid
  instance_type = var.appser_instancetype
  key_name = var.appser_keypair
  tags = local.app_server_tags
  vpc_security_group_ids = [ aws_security_group.allow_https_sg.id ]
  }

  resource "aws_security_group" "allow_https_sg" {
  name        = "allow_https_sg"
  description = "Allow https inbound traffic"
  

  ingress {
    description      = "HTTPS VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = local.app_server_tags
}