#!/bin/bash

DAY="$(date +%Y_%m_%d)"

echo "Renseigner l'adresse du serveur de sauvegarde (username@adresseIP)"
read adresse

SAVE="$adresse:/tmp"

BACKUP="/home/$DAY-backup-company.tar.gz"

if sudo tar -jcvf $BACKUP --absolue-names /home >/dev/null
then echo "Archive créée"
else echo "Error"
fi

if scp $BACKUP $SAVE
then echo "Sauvegarde réussie"
else echo "Error"
	rm $BACKUP
fi
