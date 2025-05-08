#!/bin/bash
# Autor: Raphael Alan de Oliveira Maria
# Data: 2025-05-07
# Descrição: Script para gerar e registrar uma chave SSH em uma máquina remota.
# Licença: MIT
# Uso: ./AutoSSHKeygen.sh
# Dependências: sshpass, ssh-keygen



# Configurações
USUARIO="ansible"
SENHA="P@ssw0rd3264128"
DESTINO="192.168.0.110"
CHAVE="$HOME/.ssh/id_rsa"

echo "[+] Iniciando processo de registro de chave SSH..."

# 1. Criar chave SSH (caso não exista)
if [ ! -f "$CHAVE" ]; then
    echo "[+] Gerando nova chave SSH..."
    ssh-keygen -t rsa -b 4096 -f "$CHAVE" -N ""
else
    echo "[!] Chave SSH já existe. Pulando geração."
fi

# 2. Verificar se sshpass está instalado
if ! command -v sshpass &> /dev/null; then
    echo "[+] Instalando sshpass (requer sudo)..."
    sudo apt update && sudo apt install -y sshpass
fi

# 3. Registrar chave na máquina remota
echo "[+] Registrando chave na máquina $DESTINO..."
sshpass -p "$SENHA" ssh-copy-id -o StrictHostKeyChecking=no "$USUARIO@$DESTINO"

echo "[✓] Chave registrada com sucesso!"
