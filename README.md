# Basic EC2 instance

Configuration in this directory creates EC2 instances with minimum set of arguments. It will also assign S3 bucket  (S3) to an instance.

I specified arguments for security group id and subnet are inherited from variable.tf file .


## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.



