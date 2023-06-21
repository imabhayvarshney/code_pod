provider "aws" {
  region = var.region
}

resource "aws_security_group" "ec2-sg" {
  name        = var.name
  description = "allow ssh and http traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.az
  security_groups   = ["${aws_security_group.ec2-sg.name}"]
  #key_name = "zoomkey"
  user_data = <<-EOF
                #! /bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Sample Webserver Network Nuts" | sudo tee  /home/573855.cloudwaysapps.com/hfjzxghgzg/public_html/html/index.html
  EOF


  tags = {
        Name = "webserver"
  }

}

resource "aws_ebs_volume" "data-vol" {
 availability_zone = var.az
 size = 1
 tags = {
        Name = "data-volume"
 }

}

resource "aws_volume_attachment" "ebsvolattach" {
 device_name = "/dev/xvdg"
 volume_id = "${aws_ebs_volume.data-vol.id}"
 instance_id = "${aws_instance.ec2.id}"
}



