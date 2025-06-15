-- Crear esquema si no existe
CREATE SCHEMA IF NOT EXISTS notifications;

-- Crear tabla de compañías
CREATE TABLE notifications.ta_company (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(100),
    company_code VARCHAR(255),
    company_gls VARCHAR(255)
);

-- Crear tabla de clientes remotos
CREATE TABLE notifications.ta_remote_JID (
    id SERIAL PRIMARY KEY,
    remote_jid VARCHAR(255),
    remote_name VARCHAR(255),
    company_id INTEGER,
    CONSTRAINT fk_company
      FOREIGN KEY (company_id)
      REFERENCES notifications.ta_company(id)
      ON DELETE SET NULL
);

-- Crear tabla de registro de notificaciones
CREATE TABLE notifications.ta_notification_registry (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    status INTEGER NOT NULL,
    updated_by_user_id INTEGER,
    detection_id INTEGER,
    updated_at TIMESTAMPTZ,
    message_id VARCHAR(255)
);
