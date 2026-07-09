# EFT: Arquitectura Cloud de 3 Capas en AWS

Este repositorio contiene la documentación técnica y los scripts de inicialización para el diseño e implementación de un sitio web sobre una arquitectura de 3 capas, desplegada en el Sandbox de AWS Academy.

## Arquitectura Desplegada

La solución tecnológica se basa en los modelos de provisión IaaS y PaaS, estructurada de la siguiente manera:
- **Capa Web (Pública):** Application Load Balancer (ALB) y clúster de instancias EC2 administradas por un Auto Scaling Group.
- **Capa de Datos (Privada):** Base de datos Amazon RDS (MySQL) en configuración Multi-AZ (limitado a Free Tier por restricciones de IAM en el entorno educativo).
- **Almacenamiento Global:** Amazon S3 para recursos estáticos.

![Diagrama de Arquitectura](diagrama_arquitectura.png)

## Archivos del Proyecto

- `user_data.sh`: Script de inicialización (Bootstrap) inyectado en el Launch Template de las instancias EC2 para automatizar la instalación del servidor web Apache, la recuperación de metadatos (Zona de Disponibilidad) y el consumo de recursos estáticos desde S3.

## Demostración
*(El sistema funcional se despliega temporalmente mediante el DNS público del Load Balancer durante la evaluación).*