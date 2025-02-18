resource "aws_s3_bucket" "akc-jenkins-tf-bucket" {
  bucket = "akc-jenkins-tf-bucket"
    tags = {
        createdBy        = "achallawala@presidio.com"
        Purpose          = "Jenkins Training"
    }
}