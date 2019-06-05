variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}


variable "server2_port" {
  description = "The port the server will use for HTTP requests"
  default     = 80
}


variable "ssh_port" {
  description = "The port the server will use for HTTP requests"
  default     = 22
}


variable "key_pair" {
  description = "The key pair of our new ec2 instance"
  default     = "my-key-pair" 
}

variable "bucket-name" {
  description = "Name of the S3 bucket"
  default     = "myterraform101-s3-bucket"
}

