provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "two" {
count = 5
ami = "ami-07a6f770277670015"
instance_type = "t2.medium"
key_name = "myserver"
vpc_security_group_ids = ["sg-039e0d894a4062929"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "AppServer-1", "AppServer-2", "Monitoring server"]
}
