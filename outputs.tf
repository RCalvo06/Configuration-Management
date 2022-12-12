output "ec2_public_ip" {
    value = aws_instance.apache.public_ip  
}
