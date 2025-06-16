# auton8n

**auton8n** servicio para crear flujos de automatización e integración de agentes de IA.
Este proyecto utiliza n8n para la orquestación de flujos de trabajo. La base de datos es PostgreSQL (información persistente), y Redis se utiliza para el almacenamiento en caché.

# Esquemas

### WSP-STI: 

Este flujo automatiza el envío de notificaciones de alertas generadas por el sistema de monitoreo para el cliente STI, utilizando una arquitectura basada en n8n y Evolution API.

- 🔐 Autenticación de usuarios: Se obtienen los usuarios desde una base de datos MySQL, integrada con el sistema SSO de Deliryum.AI, para validar credenciales y gestionar permisos de notificación.

- 🧩 Configuración de revisores: Una base de datos PostgreSQL mantiene la asignación de usuarios responsables de revisar alertas específicas.

- ⏱️ Ejecución periódica: Un proceso cron ejecutado desde n8n se activa cada 5 minutos para consultar nuevas alertas en el sistema de monitoreo.

- 🔄 Orquestación del flujo: Todo el proceso es gestionado por n8n, que conecta los sistemas, gestiona la lógica de negocio y ejecuta las acciones correspondientes.


## Estructura del proyecto

- `docker-compose.yml`: Orquesta los servicios principales (PostgreSQL, n8n, Evolution API, Redis).
- `evolution.env`: Configuración de variables de entorno para Evolution API.
- `.env`: Variables de entorno para la base de datos PostgreSQL.
- `init-data.sh`: Script de inicialización para usuarios y permisos en PostgreSQL.
- `n8n_flows/`: Flujos de trabajo de n8n en formato JSON.
- `evolution_instances/` y `evolution_store/`: Directorios persistentes para Evolution API.

## Requisitos

- Docker y Docker Compose instalados.
- Disponibilizar un número de teléfono para el envío de notificaciones.

## Instalación y uso

1. Clona este repositorio:
   ```sh
   git clone https://github.com/tuusuario/auton8n.git
   cd auton8n
   ```
2. Configura las variables de entorno en `evolution.env` y `.env`.
3. Inicia los servicios:
   ```sh
   docker-compose up -d
   ```
4. Seguir instrucciones en la terminal para escanear el código QR y vincular el número de teléfono que se usará para el envío de notificaciones por WhatsApp.

5. Accede a n8n en `http://localhost:5678` y a Evolution API en `http://localhost:3000`.
6. Restaura los datos iniciales (opcional):
   ```sh
   ./init-data.sh
   ```

## Notas

- Los puertos pueden ser modificados en `docker-compose.yml`.
- Para detener y eliminar los contenedores, usa:
  ```sh
  docker-compose down
  ```

  ---

añadir al nodo Global constants de n8n:

DB_HOST_SSO_DELIRYUMAI=dev-sso.mysql.database.azure.com
DB_PORT_SSO_DELIRYUMAI=3306
DB_USER_SSO_DELIRYUMAI=marcos@bluelatam.com
DB_PASS_SSO_DELIRYUMAI=Deliryum2025$$

HEADER_AUTH_NAME=apikey
HEADER_AUTH_VALUE="FBECCE6E0585-482D-94A4-53BADF68F521"

DB_HOST_DETECTIONS_DELIRYUMAI=prod-detectionsv2.mysql.database.azure.com
DB_PORT_DETECTIONS_DELIRYUMAI=3306
DB_USER_DETECTIONS_DELIRYUMAI=marcos@bluelatam.com
DB_PASS_DETECTIONS_DELIRYUMAI=Deliryum2025$$

ID_COMPANY=2