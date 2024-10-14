# Filtro basico, taer memoria ram total y la info del chassis.

sudo cat /proc/meminfo | grep -i memtotal > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Farias/RTA_ARCHIVOS_Examen_20241014/Filtro_Basico.txt

sudo dmidecode -t chassis | grep -i chassis >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Farias/RTA_ARCHIVOS_Examen_20241014/Filtro_Basico.txt

sudo dmidecode -t chassis | grep -i manufacturer >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Farias/RTA_ARCHIVOS_Examen_20241014/Filtro_Basico.txt
