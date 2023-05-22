#!/bin/bash

echo "Running postcreate.sh script"
sudo chown vscode:vscode /workspace
sudo chown vscode:vscode /home/vscode/.cache

cp -r /repo/.vscode /workspace/
cp /repo/.env /workspace/.env

if ! test -d /workspace/odoo; then
    echo "Cloning git repositories"
    cd /workspace
    git clone -b 16.0 --single-branch https://github.com/odoo/odoo.git odoo
    # Add additional repositories here
    # git clone -b 16.0 https://github.com/oca/timesheet.git timesheet
    # ^^
    # cd /workspace/timesheet
    # git submodule update --init
else
    echo "Git repositories already cloned"
fi

echo "Running postcreate.sh finished"