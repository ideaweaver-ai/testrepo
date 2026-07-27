provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "test1" {
  ami           = "ami-0abcd1234abcd1234"
  instance_type = "t2.micro"

  tags = {
    Name = "my-instance"
  }
}

resource "aws_security_group" "sg1" {
  name = "sg_test"

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "test2" {
  ami           = "ami-0abcd1234abcd1234"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.sg1.id]

  tags = {
    Name = "my-instance-2"
  }
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "my-very-unique-bucket-name-123456"

  acl = "public-read"
}
