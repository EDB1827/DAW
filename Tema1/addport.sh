#!/bin/bash

grep "Listen $1" /etc/apache2/ports.conf >> /dev/null

if [ $? -eq 0 ]
then
echo "El puerto ya existe"
else
echo "Listen $1" >> /etc/apache2/ports.conf
fi

