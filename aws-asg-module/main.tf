
provider "aws" {
  region = "us-west-2"
}

data "aws_availability_zones" "all" {}

resource "aws_autoscaling_group" "ec2_example" {
  launch_configuration = aws_launch_configuration.ec2_example.id
  availability_zones   = data.aws_availability_zones.all.names

  load_balancers    = [aws_elb.ec2_example.name]
  health_check_type = "ELB"

  min_size = 2
  max_size = 5

  tag {
      key                 = "Name"
      value               = "terraform-asg-ec2"
      propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "ec2_example" {
  image_id               = "ami-830c94e3"
  instance_type          = "t2.micro"
  # security_groups        = ["${aws_security_group.instance.name}"]
  security_groups        = [aws_security_group.instance.id]
  # key_name             = "${aws_key_pair.terra.id}"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  lifecycle { create_before_destroy = true }
}

resource "aws_security_group" "instance" {
  name = "terraform-instance-sec"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "ec2_example" {
  name                  = "terraform-asg-clb"
  # security_groups       = ["${aws_security_group.elb.name}"]
  security_groups        = [aws_security_group.elb.id]
  availability_zones    = data.aws_availability_zones.all.names

  health_check {    
      target              = "HTTP:${var.server_port}/"
      interval            = 30    
      timeout             = 3    
      healthy_threshold   = 2    
      unhealthy_threshold = 2  
  }

  listener {
    lb_port           =  var.elb_port
    lb_protocol       = "http"
    instance_port     = var.server_port
    instance_protocol = "http"
  }
}

resource "aws_security_group" "elb" {
  name = "terraform-clb-sec"

  ingress {
    from_port   = var.elb_port
    to_port     = var.elb_port
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
