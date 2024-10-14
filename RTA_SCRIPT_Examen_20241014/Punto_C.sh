# Crear grupos y usuarios, asignarles a cada usuario el hash de vagrant.

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

HASH_Vagrant=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

for i in {1..3}; do
        sudo useradd -m -s /bin/bash -c "Alumno N°$i" -G p1c2_2024_gAlumno p1c2_2024_A$i
        sudo usermod -p "$HASH_Vagrant" "p1c2_2024_A$i"
done

#for i in {1..3}; do
#       sudo usermod -p "$HASH_Vagrant" "p1c2_2024_A$i"
#done

sudo useradd -m -s /bin/bash -c "Profesor N°1" -G p1c2_2024_gProfesores p1c2_2024_P1
sudo usermod -p "$HASH_Vagrant" "p1c2_2024_P1"

# Asignar dueño y permisos.

for i in {1..3}; do
        sudo chown -R p1c2_2024_A$i:p1c2_2024_gAlumno /home/vagrant/Examenes-UTN/alumno_$i
done

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /home/vagrant/Examenes-UTN/profesores

sudo chmod -R 750 /home/vagrant/Examenes-UTN/alumno_1
sudo chmod -R 760 /home/vagrant/Examenes-UTN/alumno_2
sudo chmod -R 700 /home/vagrant/Examenes-UTN/alumno_3
sudo chmod -R 775 /home/vagrant/Examenes-UTN/profesores

# Validar whoamis.

for i in {1..3}; do
        sudo -u p1c2_2024_A$i whoami > /home/vagrant/Examenes-UTN/alumno_$i/validar.txt
done

sudo -u p1c2_2024_P1 whoami > /home/vagrant/Examenes-UTN/profesores/validar.txt
