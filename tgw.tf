resource "aws_ec2_transit_gateway" "tgw" {
  default_route_table_association = "disable"
  tags = {
    Name = "tgw_top3"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment1" {
  subnet_ids                                      = [aws_subnet.subnetsforvpc1.1.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.tgw.id
  vpc_id                                          = aws_vpc.vpcs.1.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name = "tgw_atch_vpc1"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment2" {
  subnet_ids                                      = [aws_subnet.subnetsforvpc2.1.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.tgw.id
  vpc_id                                          = aws_vpc.vpcs.2.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name = "tgw_atch_vpc2"
  }
}

