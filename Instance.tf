#Create Instance
resource "aws_instance" "Web_Server" {
    count = var.public_subnet_Count    
    ami = "ami-0b5eea76982371e91" 
    instance_type = "t2.micro"
    key_name = "LTI_Key"
    subnet_id = aws_subnet.public_subnets[count.index].id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true	
    tags = {
        Name = "Web_Server"
        Env = "Pro"
        Owner = "Ajay"
    }
}
resource "aws_instance" "App_Server" {
    count = var.private_subnet_Count - 2
    ami = "ami-08e637cea2f053dfa"
    instance_type = "t2.micro"
    key_name = "LTI_Key"
    subnet_id = aws_subnet.private_subnets[count.index].id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true	
    tags = {
        Name = "APP_Server"
        Env = "Dev"
        Owner = "Ajay"
    }
}
resource "aws_instance" "DB_Server" {
    count = var.private_subnet_Count - 2  
    ami = "ami-00874d747dde814fa"
    instance_type = "t2.micro"
    key_name = "LTI_Key"
    subnet_id = aws_subnet.private_subnets[count.index + 2].id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true	
    tags = {
        Name = "DB_Server"
        Env = "Dev"
        Owner = "Ajay"
    }
}
