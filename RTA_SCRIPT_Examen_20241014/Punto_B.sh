#!/bin/bash

sudo fdisk /dev/sdc << EOF
n
e
1


w
EOF

for i in {1..9};do
        sudo fdisk /dev/sdc << EOF
n

+1G
w
EOF
done

sudo fdisk /dev/sdc << EOF
n


w
EOF

echo "w"

# Aplicar formato a discos.
for i in {5..14}; do
        sudo mkfs -F ext4 /dev/sdc$i
done

# Montar cada disco donde corresponde.

cont_parti=5
while [ $cont_parti -le 13 ]; do
        for i in {1..3}; do
                for j in {1..3}; do
                        sudo mount /dev/sdc$cont_parti /home/vagrant/Examenes-UTN/alumno_$i/parcial_$j
                        cont_parti=$((cont_parti + 1))
                done
        done
done

sudo mount /dev/sdc14 /home/vagrant/Examenes-UTN/profesores

# Montar persistente.

cont_parti_pers=5
while [ $cont_parti_pers -le 13 ]; do
        for i in {1..3}; do
                for j in {1..3}; do
                        echo "/dev/sdc$cont_parti_pers /home/vagrant/Examenes-UTN/alumno_$i/parcial_$j ext4 defaults 0 0" | sudo tee -a /etc/fstab
                        cont_parti_pers=$((cont_parti_pers + 1))
                done
        done
done

echo "/dev/sdc14 /home/vagrant/Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
