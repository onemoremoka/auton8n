FROM docker.n8n.io/n8nio/n8n

# Instalar el nodo comunitario dentro del directorio de usuario
RUN mkdir -p /home/node/.n8n/nodes \
    && cd /home/node/.n8n/nodes \
    && npm i n8n-nodes-globals

RUN chown -R node:node /home/node/.n8n

USER node
