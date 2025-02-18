data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "al2023-ami-2023"
}

resource "aws_s3_bucket" "akc-jenkins-tf-bucket" {
  bucket = "akc-jenkins-bucket-tf"
    tags = {
        createdBy        = "achallawala@presidio.com"
        Purpose          = "Jenkins Training"
    }
}


resource "aws_instance" "akc-jenkins-tf-instance" {
  ami             = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"
  tags = {
    Name = "akc-jenkins-tf-instance"
  }
}