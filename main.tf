
module "Prometheus_Server_A" {
  source = "./Prometheus_Server"

    ami = "ami-0cb91c7de36eed2cb"
    instance_type = "t2.micro"
    server_name = "prometheus01"
    aws_region = "us-east-2"
}

module "Prometheus_Server_B" {
  source = "./Prometheus_Server"

    ami = "ami-0cb91c7de36eed2cb"
    instance_type = "t2.micro"
    server_name = "prometheus02"
    aws_region = "us-east-2"
}

#### Salidas de Información ####
output "server_public_ip_A" {
  description = "IP Publica de la instancia Prometheus01"
  value       = module.Prometheus_Server_A.server_public_ip
}

output "server_public_dns_A" {
  description = "DNS Publico de la instancia Prometheus01"
  value       = module.Prometheus_Server_A.server_public_dns
}

output "server_public_ip_B" {
  description = "IP Publica de la instancia Prometheus02"
  value       = module.Prometheus_Server_B.server_public_ip
}

output "server_public_dns_B" {
  description = "DNS Publico de la instancia Prometheus02"
  value       = module.Prometheus_Server_B.server_public_dns
}





