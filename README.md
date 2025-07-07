# auton8n

Servicio de automatización e integración de agentes de IA usando n8n, PostgreSQL y Redis.

## Funcionalidades

- Envío automático de notificaciones vía WhatsApp
- Autenticación de usuarios integrada con SSO
- Ejecución periódica de flujos (cada 5 minutos)
- Gestión de alertas y asignación de revisores


## Inicio rápido

1. **Clonar repositorio:**
   ```sh
   git clone https://github.com/tuusuario/auton8n.git
   cd auton8n
   ```

2. **Configurar variables de entorno:**
   - Editar `evolution.env`
   - Editar `.env`

3. **Iniciar servicios:**
   ```sh
   docker-compose up -d
   ```

4. **Configurar WhatsApp:**
   - Escanear código QR en la terminal
   - Vincular número de teléfono

5. **Acceder a las interfaces:**
   - n8n: `http://localhost:5678`
   - Evolution API: `http://localhost:3000`

## Comandos útiles

```sh
# Detener servicios
docker-compose down

# Restaurar datos iniciales
./init-data.sh
```