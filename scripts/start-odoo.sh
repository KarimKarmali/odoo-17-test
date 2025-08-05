#!/bin/bash

# Criar configuração dinamicamente com as variáveis de ambiente
cat > /etc/odoo/odoo.conf << EOF
[options]
addons_path = /usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons
admin_passwd = ${ADMIN_PASSWD:-admin123}
db_host = ${HOST:-localhost}
db_port = ${DB_PORT:-5432}
db_user = ${USER:-odoo}
db_password = ${PASSWORD:-odoo}
xmlrpc_port = 8069
log_level = info
data_dir = /var/lib/odoo
proxy_mode = True
EOF

# Verificar se as variáveis foram definidas
echo "=== VIKA Odoo Startup ==="
echo "Database Host: ${HOST:-not_set}"
echo "Database Port: ${DB_PORT:-not_set}"
echo "Database User: ${USER:-not_set}"
echo "Admin Password: ${ADMIN_PASSWD:-not_set}"
echo "Configuration created at /etc/odoo/odoo.conf"
echo "========================="

# Mostrar configuração criada
echo "Generated config:"
cat /etc/odoo/odoo.conf
echo "========================="

# Iniciar Odoo
exec odoo
