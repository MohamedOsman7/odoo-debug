FROM mcr.microsoft.com/devcontainers/python:0-3.11

USER root

RUN pip3 install -U copier pre-commit oca-port
RUN git config --system --add safe.directory '*' 

USER vscode
