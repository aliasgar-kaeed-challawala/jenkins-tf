resource "aws_s3_bucket" "akc-jenkins-tf-bucket" {
  bucket = "akc-jenkins-bucket-tf"
    tags = {
        createdBy        = "achallawala@presidio.com"
        Purpose          = "Jenkins Training"
    }
}
