
/* Trafico y puertos */

resource "aws_security_group" "apache" {
  name        = var.sg_name
  description = "Allow ssh and http traffic for nginx server"
  vpc_id      = local.vpc_id

  ingress {
    description = "SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "HTTPS traffic"
    from_port   = 443
    to_port     = 443
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

/* Trafico y puertos */

/* Instance  y provisioning */

// test 

resource "aws_instance" "apache" {
  ami             = local.ami_id
  instance_type   = local.instance_type
  security_groups = [aws_security_group.apache.name]
  key_name        = local.key_name

  provisioner "remote-exec" {
    inline = ["echo wait untill SSH is ready"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.apache.public_ip
    }

  }



  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.apache.public_ip}, --private-key ${local.private_key_path} apache.yml"
  }



}



/* Instance  y provisioning */
