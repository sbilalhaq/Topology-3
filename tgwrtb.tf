resource "aws_ec2_transit_gateway_route_table" "tgw_rtb1" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  depends_on = [
    aws_ec2_transit_gateway.tgw
  ]
  tags = {
    Name = "tgw_rtb1"
  }
}


resource "aws_ec2_transit_gateway_route_table" "tgw_rtb2" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  depends_on = [
    aws_ec2_transit_gateway.tgw
  ]
  tags = {
    Name = "tgw_rtb2"
  }  
}

resource "aws_ec2_transit_gateway_route_table_association" "tgwrtb-tgwatch1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtb1.id
  depends_on = [
    aws_ec2_transit_gateway_route_table.tgw_rtb1
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "tgwrtb-tgwatch2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtb2.id
  depends_on = [
    aws_ec2_transit_gateway_route_table.tgw_rtb2

  ]
}

