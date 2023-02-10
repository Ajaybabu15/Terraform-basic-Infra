### EIP(Elastic IP required for NAT Gateway) AND NAT GATEWAY

resource "aws_eip" "LTI_NAT_eip" {     #Created Elastic ip
  vpc = true
}

resource "aws_nat_gateway" "LTI_NGW" {          #Created NAt_Gatway 
  allocation_id = aws_eip.LTI_NAT_eip.id        #eip is Allocated to Nat Gatway 
  subnet_id = aws_subnet.public_subnets[1].id   #Nat Attached to Public Subnet
}