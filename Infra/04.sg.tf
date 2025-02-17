

# Grupo de Seguidad para habilitar los puertos 22 (SSH), 80 (http), 9090 (prometheus), 9100 (node_exporter) y 3000 (grafana)
resource "aws_security_group" "prometheus01_sg" {
  name        = "${var.server_name}_sg"
  description = "Allow HTTP and SSH"

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

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "Grupo de Seguridad para Prometheus01"
    Environment = "Dev"
    Owner       = "puchalvert@yahoo.com"
    Team        = "Bader_Trolo"
    Project     = "Prometheus y Grafana"
  }
}
