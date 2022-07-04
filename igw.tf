resource "aws_internet_gateway" "igw_01" {

  tags = {
    Name = "igw_01"
  }
}

resource "aws_internet_gateway_attachment" "igw_vpc1" {
  internet_gateway_id = aws_internet_gateway.igw_01.id
  vpc_id              = aws_vpc.vpcs.1.id
  
  tags = {
    Name = "igw_vpc1"
  }
}
