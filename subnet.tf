resource "aws_subnet" "public_subnets" {
  count = var.public_subnet_Count
  #count = "${var.env!="prod" ? 1 : 3}"
  vpc_id = aws_vpc.LTI_VPC.id
  #cidr_block = element(var.public_subnet_cidr, count.index)
  cidr_block        = "10.0.${1 + count.index}.0/24"
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "LTI_Public_Subnet_${count.index + 1}"
  }
}


resource "aws_subnet" "private_subnets" {
  count = var.private_subnet_Count
  #count = "${var.env!="prod" ? 1 : 3}"
  vpc_id = aws_vpc.LTI_VPC.id
  #cidr_block = element(var.private_subnet_cidr, count.index)
  cidr_block        = "10.0.${3 + count.index}.0/24"
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "LTI_Private_Subnet_${count.index + 1}"
  }
}
