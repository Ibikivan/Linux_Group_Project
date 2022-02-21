#!/bin/bash
echo "Entrez le nom d'utilisateur à supprimer"
read username

BACKUP="/home/$username-backup.tar.gz"
if grep -i "^$username:" /etc/passwd > /dev/null ; 
	then
	#statements
	echo "L'utilisateur $username va être supprimé"
	if sudo tar -jcvf $BACKUP /home/$username ; 
		then
		#statements
		userdel --remove $username
		echo "L'utilisateur $username a été supprimé et son répertoire archivé"
		
		if crontab -l > /tmp/ma_crontab ;
		 then
			#statements
			crontab ma_crontab
			echo "*\ *\ 30 *\ *\ rm $BACKUP" >> ma_crontab
			echo "Suppression dans 30 jours programmée"
			rm -f ma_crontab
		else
			echo "Une erreur s'est produite lors de la programmation de la suppression"
		fi
	else
		echo "Une erreur s'est produite au moment de la création de l'archive"
	fi
else
	echo "L'utilisateur $username n'existe pas"
fi