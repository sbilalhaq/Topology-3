resource "aws_route_table" "vpcrtb1" {
  vpc_id = aws_vpc.vpcs.1.id

  route {
    cidr_block = var.vpc2_cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }
  depends_on = [
    aws_vpc.vpcs,
    aws_ec2_transit_gateway.tgw
  ]
  
    
  
  tags = {
    Name = "rtb_vpc1"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnetsforvpc1.1.id
  route_table_id = aws_route_table.vpcrtb1.id
}



resource "aws_route_table" "vpcrtb2" {
  vpc_id = aws_vpc.vpcs.2.id

  route {
    cidr_block = var.vpc1_cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }
  depends_on = [
    aws_vpc.vpcs,
    aws_ec2_transit_gateway.tgw

  ]
  tags = {
    Name = "rtb_vpc2"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnetsforvpc2.1.id
  route_table_id = aws_route_table.vpcrtb2.id
}
