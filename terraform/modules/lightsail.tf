resource "aws_lightsail_static_ip" "web" {
  count = 1
  name  = "${var.prefix}_staticip"
}

resource "aws_lightsail_key_pair" "web" {
  count      = 1
  name       = "${var.prefix}_key"
  public_key = file("~/.ssh/${var.prefix}.pub")

  lifecycle {
    ignore_changes = [
      public_key
    ]
  }
}

resource "aws_lightsail_instance" "web" {
  name              = "${var.prefix}_instance"
  availability_zone = "${var.region}a"
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "medium_2_0"
  key_pair_name     = "${var.prefix}_key"
}

resource "aws_lightsail_static_ip_attachment" "web" {
  count          = 1
  static_ip_name = element(aws_lightsail_static_ip.web[*].name, 0)
  instance_name  = element(aws_lightsail_instance.web[*].name, 0)
}

resource "aws_lightsail_instance_public_ports" "web" {
  instance_name = aws_lightsail_instance.web.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidrs     = ["${var.allow_ssh_ip}/32"]
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
}
