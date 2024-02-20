
resource "aws_instance" "web" {
  ami             = "${var.image_id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = ["${aws_security_group.Inbound_Rule.id}"]

  tags = {
    Name = "First-aws-instance"
  }
  
  user_data = file("${path.module}/userdata.sh")
  
  connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("${path.module}/id_rsa")
      host = "${self.public_ip}"
    }

  provisioner "file" {
    source = "readme.md"
    destination = "/tmp/readme.md"
    
  }

  provisioner "file" {
    content = "This is content file provisioner"
    destination = "/tmp/content.txt"
    
  }
  
}


