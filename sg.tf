resource "aws_security_group" "sg_sshec2" {
  name        = "allow_ssh"
  description = "Allow sshinbound traffic"
  vpc_id      = aws_vpc.vpcs.1.id

  ingress {
    description      = "ssh from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "ssh"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
