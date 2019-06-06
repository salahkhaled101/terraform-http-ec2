provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/root/.aws/credentials"
  profile                 = "terraform"
}


resource "aws_instance" "example" {
  ami                    = "ami-08938c5bb5f2f4da2"
  instance_type          = "t2.micro"
  key_name               = "${var.key_pair}"
  

  iam_instance_profile   = "${aws_iam_instance_profile.test_profile.name}"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags = {
    Name = "terraform-task"
  }

}





resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "${var.ssh_port}"
    to_port     = "${var.ssh_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


 ingress {
    from_port   = "${var.server2_port}"
    to_port     = "${var.server2_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_s3_bucket" "s3-module" {
  bucket = "${var.bucket-name}"
  acl    = "private"

  tags   = {
    Name = "terraform bucket"
    Environmet = "Dev-Env"
  }
  versioning {
    enabled = true
  }
}


