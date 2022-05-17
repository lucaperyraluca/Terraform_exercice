resource "aws_vpc" "vpc_de_terraform_ej6" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "internetgw" {
    vpc_id = aws_vpc.vpc_de_terraform_ej6.id
    tags = {
        Name = "igwdevpc_ej6" 
    }
  
}

resource "aws_subnet" "g9_subnet_1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc_de_terraform_ej6.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "subnet_g91-ue1a"
  }
}

resource "aws_subnet" "g9_subnet_2" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.vpc_de_terraform_ej6.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "subnet_g92-ue1b"
  }
}

resource "aws_subnet" "g9_subnet_3" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.vpc_de_terraform_ej6.id
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "subnetg93-ue1c"
  }
}

resource "aws_route_table" "g9route_table" {
    vpc_id = aws_vpc.vpc_de_terraform_ej6.id

    route {
      #cidr_block = "0.0.0.0/0"
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.internetgw.id
    }
    tags = {
      Name = "Route-table-ejercicio6"    
    }
    
}


#resource "aws_network_interface" "interfaces-NGNX1" {
#  subnet_id   = aws_subnet.g9_subnet_1.id
#  private_ips = ["10.0.1.15"]

#  tags = {
#    Name = "primary_network_interface"
#  }
#}
  

#resource "aws_network_interface" "interfaces-NGNX2" {
#  subnet_id   = aws_subnet.g9_subnet_2.id
#  private_ips = ["10.0.2.15"]

#  tags = {
#    Name = "primary_network_interface"
#  }
#}
  