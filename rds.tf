provider "aws" {
  region = "eu-west-1"  
}

resource "aws_db_subnet_group" "cms_db_subnet_group" {
  name       = "cms-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id]
}

resource "aws_db_instance" "cms_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12"
  instance_class       = "db.t2.micro"
  name                 = "cmsdb"
  username             = "cmsuser"
  password             = "cmspassword"
  parameter_group_name = "default.postgres12"
  skip_final_snapshot = true  

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.cms_db_subnet_group.name

  tags = {
    Name = "CMS Database"
  }
}

resource "aws_security_group" "db_sg" {
  name_prefix = "db-sg-"
  vpc_id      = aws_vpc.cms_vpc.id

  // Define your database security group rules here
}


'''
We define an RDS subnet group to specify the subnets where the RDS instance should be deployed.
We create an RDS instance with PostgreSQL engine version 12.
We set up allocated storage, instance class, and other database settings.
We provide a username and password for the database user.
We specify the security group and subnet group for the RDS instance.
We create a security group for the RDS instance, where you can define inbound and outbound rules.
""" 