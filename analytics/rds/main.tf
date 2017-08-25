provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region     = "us-west-2"
}

resource "aws_db_instance" "mariadb_instance" {
  identifier        = "${var.role}-01"
  engine            = "mariadb"
  engine_version    = "${var.rds_instance_engine_version}"
  multi_az          = "${var.rds_multi_az}"
  allocated_storage = "${var.rds_allocated_storage}"
  storage_type      = "gp2"
  instance_class    = "${var.rds_instance_class}"
  username          = "root"
  password          = "${var.rds_password}"
  skip_final_snapshot = true
  vpc_security_group_ids = [
    "sg-8796b3fd"  
  ]
  backup_retention_period = "${var.rds_backup_retention_period}"

  tags {
    Role                      = "${var.role}"
  }
}

resource "aws_db_instance" "read_replication" {
  replicate_source_db = "${var.role}-01"
  identifier = "${var.role}-02"
  instance_class = "${var.rds_instance_class_slave}"
  storage_type = "gp2"
  skip_final_snapshot = true
  vpc_security_group_ids = [
    "sg-8796b3fd"  
  ]
    tags {
        Role = "${var.role}"
  }
}

