# Creating RDS Instance
resource "aws_db_subnet_group" "dbsg" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "db-instance" {
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.dbsg.id
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = "db.tg4.micro"
  multi_az               = true
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  tags = {
    Name = "db"
  }
}
