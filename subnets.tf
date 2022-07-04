resource "aws_subnet" "subnetsforvpc1" {
  vpc_id = aws_vpc.vpcs.1.id
  for_each = {
    1 = var.sub1_vpc1

  }
  cidr_block = each.value



  tags = {
    Name = "1sub ${each.key}"
  }
}

resource "aws_subnet" "subnetsforvpc2" {
  vpc_id = aws_vpc.vpcs.2.id
  for_each = {
    1 = var.sub1_vpc2

  }
  cidr_block = each.value



  tags = {
    Name = "2sub ${each.key}"
  }
}

