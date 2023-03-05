#!/bin/bash

set -e

if ! test -f /etc/odoo/odoo.conf; then
  echo "Create new config"
  cp /etc/odoo/empty.odoo.conf /etc/odoo/odoo.conf
  #chmod g+w /etc/odoo/odoo.conf
fi

while ! test -d /src/odoo/odoo-bin; do
  echo "Waiting for odoo checkout"
  sleep 1000
done

echo "Source availble"
/usr/bin/python3 /tmp/debugpy --listen 0.0.0.0:8888 /src/odoo/odoo-bin -c /etc/odoo/odoo.conf --db_user=$db_user --db_host=$db_host --db_password=$db_password

exit 1