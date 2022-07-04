resource "aws_security_group" "sg_sshec2" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vpcs.1.id

  ingress {
    description      = "ssh from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
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


data "aws_instance" "instance_data" {
  instance_id = aws_instance.ec2_ssh.id
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg_sshec2.id
  network_interface_id = data.aws_instance.instance_data.network_interface_id
}


resource "aws_security_group" "sg_connectec2" {
  name        = "allow_connect"
  description = "Allow connect inbound traffic"
  vpc_id      = aws_vpc.vpcs.2.id

  ingress {
    description      = "connect from vm"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
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
    Name = "allow_connect"
  }
}

data "aws_instance" "instance_data2" {
  instance_id = aws_instance.ec2_connect.id
}

resource "aws_network_interface_sg_attachment" "sg_attachment2" {
  security_group_id    = aws_security_group.sg_connectec2.id
  network_interface_id = data.aws_instance.instance_data2.network_interface_id
}
