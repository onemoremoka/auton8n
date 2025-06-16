-- Crear esquema si no existe
CREATE SCHEMA IF NOT EXISTS notifications;

-- Crear tabla de compañías
CREATE TABLE IF NOT EXISTS notifications.ta_company (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(100),
    company_code VARCHAR(255),
    company_gls VARCHAR(255)
);

-- Crear tabla de clientes remotos
CREATE TABLE IF NOT EXISTS notifications.ta_remote_jid (
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
CREATE TABLE IF NOT EXISTS notifications.ta_notification_registry (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    status INTEGER NOT NULL,
    updated_by_user_id INTEGER,
    detection_id INTEGER,
    updated_at TIMESTAMPTZ,
    message_id VARCHAR(255) UNIQUE,
    remote_id INTEGER,
    CONSTRAINT fk_remote
        FOREIGN KEY (remote_id)
        REFERENCES notifications.ta_remote_jid(id)
        ON DELETE SET NULL
);

-- Crear tabla de mapeo de reacciones
CREATE TABLE IF NOT EXISTS notifications.ta_reaction_map (
    id SERIAL PRIMARY KEY,
    react_emoji VARCHAR(100) NOT NULL,   
    react_code INTEGER NOT NULL,            
    react_label VARCHAR(100),                 
    react_description TEXT,                  
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
);
