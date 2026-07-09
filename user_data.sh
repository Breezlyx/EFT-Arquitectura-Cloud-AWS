#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
AZ=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone`

echo "<h1>EFT Arquitectura 3 Capas - Francisco Sandoval</h1>" > /var/www/html/index.html
echo "<p>Esta es una prueba de balanceo. Instancia respondiendo desde la Zona de Disponibilidad: <b>$AZ</b></p>" >> /var/www/html/index.html
echo "<p><i>El ALB esta distribuyendo el trafico correctamente entre las instancias.</i></p>" >> /var/www/html/index.html
echo "<hr>" >> /var/www/html/index.html
echo "<h3>Recurso Estatico (S3):</h3>" >> /var/www/html/index.html
echo "<img src='https://s3-estaticos-fs-2026.s3.us-east-1.amazonaws.com/Arquitectura+AWS.jpg' alt='Diagrama de Arquitectura' style='max-width: 100%; height: auto;'>" >> /var/www/html/index.html