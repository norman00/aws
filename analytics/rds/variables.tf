variable "aws_access_key_id" {}

variable "aws_secret_access_key" {}

variable "rds_instance_engine_version" {
  default     = "10.0.17"
  description = "The engine version to use"
}

variable "rds_multi_az" {
  default     = "false"
  description = "Specifies if the RDS instance is multi-AZ"
}

variable "rds_allocated_storage" {
  default     = "10"
  description = "The allocated storage in GB"
}

variable "rds_instance_class" {
  default     = "db.t2.micro"
  description = "The instance type of the RDS instance"
}

variable "rds_instance_class_slave" {
   default = "db.t2.micro"
   description = "The instance type of the RDS instance"
}

variable "rds_username" {
  default     = "root"
  description = "Username for the master DB user"
}

variable "rds_password" {
  default     = "rds4test"
}

variable "rds_backup_retention_period" {
  default     = "1"
  description = "The backup retention period"
}

variable "role" {
  default = "mariadb-test"
}

