resource "aws_vpc" "vpcs" {
  for_each = {
    1 = var.vpc1_cidr
    2 = var.vpc2_cidr
  }

  cidr_block = each.value

  tags = {
    Name = "use1-prod-vpc ${each.key}"
  }
}

