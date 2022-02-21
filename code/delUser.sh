#!/bin/bash

echo "Entrez le nom d'utilisateur à supprimer ou entrez 'retour' pour annuler"
echo
printf "Tapez ici - "
read username

if [[ $username == "retour" ]]; then
	
	echo
	echo "Opération annulé"
	echo
	echo "Tapez sur la touche 'Entrer' pour continuer"

else

	BACKUP="/home/Archives/$username-backup.tar.gz"
	if grep -i "^$username:" /etc/passwd > /dev/null ; 
		then
		#statements
		echo "L'utilisateur $username va être supprimé"
		if sudo tar -jcvf $BACKUP --absolute-names /home/$username >/dev/null; 
			then
			#statements
			userdel --remove $username 2>> userLog.txt
			echo
			echo "L'utilisateur $username a été supprimé et son répertoire archivé"
			
			#if crontab -l > /tmp/ma_crontab ;
			#then
				#statements
			if echo "*\ *\ 30 *\ *\ rm $BACKUP" >> /tmp/ma_crontab
			then crontab /tmp/ma_crontab
				echo
				echo "Suppression dans 30 jours programmée"
				rm -f /tmp/ma_crontab
				echo
				echo "Tapez la touche 'Entrer' pour continuer"
			else
				echo
				echo "Une erreur s'est produite lors de la programmation de la suppression"
				echo
				echo "Tapez la touche 'Entrer' pour continuer"

			fi
		else
			echo
			echo "Une erreur s'est produite au moment de la création de l'archive"
			echo
			echo "Tapez la touche 'Entrer' pour continuer"
		fi
	else
		echo "L'utilisateur $username n'existe pas"
		echo
		echo "Tapez la touche 'Entrer' pour continuer"
	fi

fi
