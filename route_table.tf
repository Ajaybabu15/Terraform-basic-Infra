# Create a Route Table & Associate with Internet Gateway route for Public Subnet
resource "aws_route_table" "RTB_Public" {
  vpc_id = aws_vpc.LTI_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.LTI_IGW.id
  }

  tags = {
    Name = "LTI_RTB_Public"
  }
}

# Route Table Association with Public_Subnet
resource "aws_route_table_association" "LTI_RTB_public_subnets" {
  count          = var.public_subnet_Count
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.RTB_Public.id
}

# Create a Route Table & Associate via NAT Gateway Route for Private subnet
resource "aws_route_table" "RTB_Private" {
  vpc_id = aws_vpc.LTI_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.LTI_NGW.id
  }

  tags = {
    Name = "LTI_RTB_Private"
  }
}

# Route Table Association with Private_Subnet
resource "aws_route_table_association" "LTI_RTB_private_subnets" {
  count          = var.private_subnet_Count
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.RTB_Private.id
}
