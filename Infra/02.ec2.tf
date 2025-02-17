resource "aws_instance" "Prometheus01" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name        = "${var.server_name}"
    Environment = "Dev"
    Owner       = "puchalvert@yahoo.com"
    Team        = "Bader_Trolo"
    Project     = "Prometheus y Grafana"
  }

  # Incluir script de instalación
  user_data = file("${path.module}/install_prometheus.sh")

  key_name = aws_key_pair.prometheus01.key_name # linkea esta instancia con la llave de abajo

  vpc_security_group_ids = [aws_security_group.prometheus01_sg.id]

}
