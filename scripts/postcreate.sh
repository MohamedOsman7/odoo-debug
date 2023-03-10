#!/bin/bash

echo "Running postcreate.sh script"
sudo chown vscode:vscode /workspace

cp -r /repo/.vscode /workspace/
cp /repo/.env /workspace/.env

sudo chown vscode:vscode /home/vscode/.cache

if ! test -d /workspace/odoo; then
    echo "Cloning git repositories"
    cd /workspace
    git clone -b 15.0 --single-branch https://github.com/odoo/odoo.git odoo
    # Add additional repositories here
    # git clone -b master https://github.com/oca/timesheet.git timesheet
    # ^^
    # cd /workspace/timesheet
    # git submodule update --init
else
    echo "Git repositories already cloned"
fi

echo "Running postcreate.sh finished"