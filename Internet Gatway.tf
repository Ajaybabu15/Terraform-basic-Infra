# Create a Internet Gateway
resource "aws_internet_gateway" "LTI_IGW" {
  vpc_id = aws_vpc.LTI_VPC.id

  tags = {
    Name = "LTI_IGW"
  }
}
