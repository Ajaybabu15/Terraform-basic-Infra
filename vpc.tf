# Create a VPC
resource "aws_vpc" "LTI_VPC" {
  cidr_block = var.LTI_VPC_cidr
  tags = {
    Name = "LTI_VPC"
  }
}
