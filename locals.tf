locals {
  vpc_id           = "vpc-0217106027adaab03"
  ssh_user         = "ubuntu"
  key_name         = "devops"
  private_key_path = "/home/ubuntu-baselocal/.ssh/id_rsa"
  ami_id           = "ami-0574da719dca65348"
  instance_type    = "t2.micro"
}
