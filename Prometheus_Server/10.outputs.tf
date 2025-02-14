#### Salidas de Información ####
output "server_public_ip" {
  description = "IP Publica de la instancia Prometheus01"
  value       = aws_instance.Prometheus01.public_ip
}

output "server_public_dns" {
  description = "DNS Publico de la instancia Prometheus01"
  value       = aws_instance.Prometheus01.public_dns
}