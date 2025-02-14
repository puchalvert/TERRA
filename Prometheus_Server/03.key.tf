
# SSH: ssh-keygen -t rsa -b 2048 -f "prometheus01.key"

resource "aws_key_pair" "prometheus01" {
  key_name   = "${var.server_name}"	
  public_key = file("${var.server_name}.key.pub")

  tags = {
    Name        = "Clave SSH para ${var.server_name}"
    Environment = "Dev"
    Owner       = "puchalvert@yahoo.com"
    Team        = "Bader_Trolo"
    Project     = "Prometheus y Grafana"
  }
}