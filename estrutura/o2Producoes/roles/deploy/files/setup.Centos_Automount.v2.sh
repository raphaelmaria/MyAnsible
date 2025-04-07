#!/bin/sh
# DESCRICAO: Setup FSTAB Mount Server 
# SINOPSE:
# USO/EXEMPLO: .\setup.Centos_Automount.v2.sh
#
# OPCOES: 
# AUTHOR: Raphael Maria <http://raphaelmaria.com.br>
# VERSAO: 0.0.1
# LICENCA: LICENSE GPL <http://gnu.org/licenses/gpl.html>

cp /etc/fstab /etc/fstab.bkp
#############################################
#####      Configurando Diretorios      #####
#############################################
cp -b /etc/fstab /root/backups/fstab.bkps
ln -s /mnt /Volumes
mkdir -p /mnt/cache
ln -s /mnt/cache /mnt/Cache_Nuke
ln -s /mnt/cache /mnt/cache_nuke
umount -a
mkdir /mnt/RRender
chmod 777 /mnt/RRender
mkdir /mnt/Library
chmod 777 /mnt/Library
mkdir /mnt/Library2
chmod 777 /mnt/Library2
mkdir /mnt/RAW1
chmod 777 /mnt/RAW1
mkdir /mnt/RAW2
chmod 777 /mnt/RAW2
mkdir /mnt/RAW3
chmod 777 /mnt/RAW3
mkdir /mnt/RAW4
chmod 777 /mnt/RAW4
mkdir /mnt/RAWADV
chmod 777 /mnt/RAWADV
mkdir /mnt/Publicidade
chmod 777 /mnt/Publicidade
mkdir /mnt/Entretenimento
chmod 777 /mnt/Entretenimento
mkdir /mnt/Entretenimento2
chmod 777 /mnt/Entretenimento2
mkdir /mnt/Entretenimento3
chmod 777 /mnt/Entretenimento3
mkdir /mnt/Entretenimento4
chmod 777 /mnt/Entretenimento4
mkdir /mnt/Onix
chmod 777 /mnt/Onix
mkdir /mnt/Install
chmod 777 /mnt/Install
mkdir /mnt/opt2
chmod 777 /mnt/opt2
mkdir /mnt/cache
chmod -R 777 /mnt/cache
mkdir /mnt/raid
chmod -R 777 /mnt/raid

echo "# Servidor Royal Render" >> /etc/fstab
echo "192.168.8.200:/mnt/RRender /mnt/RRender nfs defaults,nofail 0 0" >> /etc/fstab

echo "# Diretorios de servidores" >> /etc/fstab
echo "192.168.8.2:/Storage/Library            /mnt/Library            nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.48:/Storage/Library2          /mnt/Library2           nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.19:/Storage/RAW1              /mnt/RAW1               nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.32:/Storage/RAW2              /mnt/RAW2               nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.38:/Storage/RAW3              /mnt/RAW3               nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.81:/mnt/storage/RAW4              /mnt/RAW4               nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.86:/Storage/RAWADV            /mnt/RAWADV             nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.14:/mnt/storage/Publicidade       /mnt/Publicidade        nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.31:/Storage/Entretenimento    /mnt/Entretenimento     nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.22:/Storage/Entretenimento2   /mnt/Entretenimento2    nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.25:/Storage/Entretenimento3   /mnt/Entretenimento3    nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.39:/Storage/Entretenimento4   /mnt/Entretenimento4    nfs     defaults,nofail        0 0" >> /etc/fstab

echo "# Servidores auxiliares" >> /etc/fstab
echo "#192.168.8.33:/opt                       /opt2                    nfs     defaults,nofail        0 0" >> /etc/fstab
echo "192.168.8.2:/Storage/Onix               /mnt/Onix               nfs     defaults,nofail        0 0" >> /etc/fstab
echo "#192.168.8.7:/Storage/Install            /mnt/Install            nfs     defaults,nofail        0 0" >> /etc/fstab
