#######################################################
############# Region definition
#######################################################
variable "aws_access_key_id" {
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
}

variable "region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "avl_zone_00" {
  description = "availability zone"
  default = "us-east-1a"
}

variable "avl_zone_01" {
  description = "availability zone"
  default = "us-east-1b"
}

variable "db_subnet_public_250" {
  description = "subnet"
  default = "subnet-9a3958d2"
}

variable "db_sg_public" {
  description = "security group"
  default = "sg-7922dd08"
}

variable "db_subnet_private_100" {
  description = "subnet"
  default = "subnet-4801a712"
}

variable "db_subnet_private_200" {
  description = "subnet"
  default = "subnet-2c222f49"
}

variable "db_name" {
  description = "name"
  default = "shipdb"
}

variable "db_username" {
  description = "username"
  default = "ric03uec"
}

variable "db_password" {
  description = "password"
  default = "testing1234"
}

#######################################################
############# Credentials for AWS connection
#######################################################
variable "aws_key_name" {
  description = "Key Pair Name used to login to the box"
  default = "login_key_us_east_1"
}

variable "aws_key_filename" {
  description = "Key Pair FileName used to login to the box"
  default = "login_pem_us_east_1.pem"
}

#######################################################
############# AMI Variables
#######################################################
variable "instance_type_db" {
  //make sure it is compatible with AMI, not all AMIs allow all instance types "
  default = "db.t2.micro"
  description = "AWS Instance type for database"
}
