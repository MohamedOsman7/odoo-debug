#!/bin/bash

echo "Running postcreate.sh script"
cp /repo/.vscode/* /workspace/.vscode/
cp /repo/.env /workspace/.env

sudo chown vscode:vscode workspace/

if ! test -d /workspace/odoo; then
    echo "Cloning git repositories"
    cd /workspace
    git clone -b 15.0 --single-branch https://github.com/odoo/odoo.git odoo
    git clone -b master https://github.com/c4a8-odoo/prod.git user
    cd /workspace/user
    git submodule update --init
else
    echo "Git repositories already cloned"
fi

echo "Running postcreate.sh finished"