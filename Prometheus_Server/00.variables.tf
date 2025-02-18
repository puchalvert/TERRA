variable "aws_region" {
  description = "Región de AWS"
  default     = "us-east-2"  # Cambia según tu preferencia
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t2.micro"
}

variable "ami" {
  description = "ID de la AMI"
  default     = "ami-0cb91c7de36eed2cb"  # Ubuntu Server
}

variable "server_name" {
  description = "Nombre de la instancia"
  default     = "prometheus01"
  }

  variable "cidr_block" {
  description = "CIDR Block"
  default     = "0.0.0.0/0"
}


