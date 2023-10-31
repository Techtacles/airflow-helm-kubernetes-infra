resource "aws_ebs_volume" "ebs_pvc" {
  availability_zone = "us-east-1a"
  size              = 10
  type              = "io1"

  tags = {
    Name = "PvcEbsVolume"
  }
}
