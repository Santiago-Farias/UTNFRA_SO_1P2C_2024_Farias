# Filtro avanzado: taer mi IP publica, mi user, mi hash y la url de mi repo.

mi_ip=$(curl -s ifconfig.me)
soy=$(whoami)
mi_hash=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}' | sed 's/\.\.//')
mi_remoto=$(git remote get-url origin)

echo "Mi IP publica es: mi_ip" > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Farias/RTA_ARCHIVOS_Examen_20241014/Filtro_Avanzado.txt
echo "Mi usuario es: $soy" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Farias/RTA_ARCHIVOS_Examen_20241014/Filtro_Avanzado.txt
echo "El Hash de mi usuario es: $mi_hash" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Farias/RTA_ARCHIVOS_Examen_20241014/Filtro_Avanzado.txt
echo "La URL de mi repositorio es: $mi_remoto" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Farias/RTA_ARCHIVOS_Examen_20241014/Filtro_Avanzado.txt
