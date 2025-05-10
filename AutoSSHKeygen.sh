#!/bin/bash
# Autor: Raphael Alan de Oliveira Maria
# Data: 2025-05-07
# Descrição: Script para gerar e registrar uma chave SSH em uma máquina remota.
# Licença: MIT
# Uso: ./AutoSSHKeygen.sh
# Dependências: sshpass, ssh-keygen

ipAddress= read -p "Digite o IP da máquina remota: " ipAddress
PASSWORD= read -sp "Digite a senha da máquina remota: " PASSWORD
sudo ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa << EOF




EOF

sudo ssh-copy-id -i /root/.ssh/id_rsa.pub ansible@$ipAddress << EOF
yes
$PASSWORD
EOF
echo "Chave SSH gerada e registrada com sucesso na máquina remota."
exit 0
# Fim do script
