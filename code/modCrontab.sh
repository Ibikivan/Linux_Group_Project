#!/bin/bash

crontab -l > /tmp/ma_crontab

echo "choisir la minute (00 à 59 ou *)"
read min

echo "choisir l'heure (00 à 23 ou *)"
read heure

#echo "choisir le jour du mois (00 à 31 ou *)"
#read jour

#echo "choisir le mois (1 à 12 ou *)"
#read mois

echo "choisir le jour de la semaine (o à 6, o étant dimanche; ou *)"
read day


echo "$min $heure * * $day backup.sh" >> ma_crontab

if crontab ma_crontab
then echo "Sauvegarde programmée"
	rm -f ma_crontab

else echo "Une erreur s'est produite"
fi



