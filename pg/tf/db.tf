resource "aws_db_instance" "db_master" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "9.5"
  database_port        = "5432"
  instance_class       = "${var.instance_type_db}"
  name                 = "${var.db_name}"
  username             = "${var.db_username}"
  password             = "${var.db_password}"
  vpc_security_group_ids = ["${var.db_sg_public}"]
  db_subnet_group_name = "${aws_db_subnet_group.db_subnet_group.id}"
  multi_az             = true
}

## subnets in different AZ's in same region for replication and backups
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = ["${var.db_subnet_private_100}", "${var.db_subnet_private_200}"]

  tags {
    Name = "db_subnet_group"
  }
}
