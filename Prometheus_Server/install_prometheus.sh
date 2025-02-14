#!/bin/bash
set -e # Abortar si hay errores

# Actualizar repositorios e instalar dependencias
sudo apt-get update
sudo apt-get install -y wget tar

# Crear usuario y directorios para Prometheus
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

# Obtener el URL de la última versión de Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-amd64.tar.gz -O /tmp/prometheus.tar.gz

# Descargar y extraer Prometheus
cd /tmp
tar xvf prometheus.tar.gz
cd prometheus-*

# Mover archivos de Prometheus
sudo cp prometheus /usr/local/bin/
sudo cp promtool /usr/local/bin/
sudo cp -r consoles /etc/prometheus/
sudo cp -r console_libraries /etc/prometheus/
sudo cp prometheus.yml /etc/prometheus/

# Asignar permisos
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus /usr/local/bin/prometheus /usr/local/bin/promtool


# Crear archivo de configuración de Prometheus
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOL
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOL

# Iniciar y habilitar servicio Prometheus
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus


# Descargar y extraer Node Exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz -O /tmp/node_exporter.tar.gz
cd /tmp
tar xvf node_exporter.tar.gz

# Mover archivos de Node Exporter
cd node_exporter-*
sudo cp node_exporter /usr/local/bin/

# Crear usuario y servicio de systemd para Node Exporter
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOL
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOL

# Asignar permisos
sudo chown -R node_exporter:node_exporter /usr/local/bin/node_exporter /etc/systemd/system/node_exporter.service

# Iniciar y habilitar servicio Node Exporter
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter


