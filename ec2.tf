resource "aws_instance" "ec2_ssh" {
  ami           = var.ami_ec2
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnetsforvpc1.1.id

  tags = {
    Name = "ec2_ssh"
  }
}

resource "aws_instance" "ec2_connect" {
  ami           = var.ami_ec2
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnetsforvpc2.1.id

  tags = {
    Name = "ec2_connect"
  }
}

resource "aws_eip" "eipforssh" {
  instance = aws_instance.ec2_ssh.id
  vpc      = true
  tags = {
    Name = "eip_ssh"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_ssh.id
  allocation_id = aws_eip.eipforssh.id
}