output "db_instance_id" {
  value = "${aws_db_instance.db_master.id}"
}

output "db_instance_address" {
  value = "${aws_db_instance.db_master.address}"
}
