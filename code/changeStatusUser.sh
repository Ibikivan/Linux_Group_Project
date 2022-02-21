#!/bin/bash

function desactiveUser {
	if grep -i "^$username:" /etc/passwd > /dev/null; 
then
	echo "Le compte d'utilisateur $username va être désactivé" 
    if sudo passwd -l $username > /dev/null;
	then
		echo "Utilisateur désactivé"
		echo
		echo "Tapez sur la touche 'Entrer' pour continuer"
	else
		echo "une erreur s'est produite"
		echo
		echo "Tapez sur la touche 'Entrer' pour continuer"
	fi
else
	echo "L'utilisateur $username n'existe pas"
	echo
	echo "Tapez sur la touche 'Entrer' pour continuer"
fi
}

function activeUser {
	if grep -i "^$username:" /etc/passwd > /dev/null ; 
then
	echo "Le compte d'utilisateur $username va être activé" 
    if sudo passwd -u $username > /dev/null ;
	then
		echo
		echo "Utilisateur activé"
		echo
		echo "Tapez sur la touche 'Entrer' pour continuer"
	else
		echo "Une erreur s'est produite"
		echo
		echo "Tapez sur la touche 'Entrer' pour continuer"
	fi
else
	echo "L'utilisateur $username n'existe pas"
	echo
	echo "Tapez sur la touche 'Entrer' pour continuer"
fi
}
echo
echo "Entrer le nom de l'utilisateur à modifier ou tapez 'retour' pour annuler"
echo
printf "Tapez ici - "
read username

if [[ $username == retour ]]; then

	echo
	echo "Opération annulée, retour en arrière !"
	echo
	echo "Tapez sur la touche 'Entrer' pour continuer"

else

	echo
	echo "Quelle action voulez vous effectuer ?"
	echo
	echo "1. Activer le compte"
	echo "2. Désactiver le compte"
	echo
	printf "Tapez ici - "
	read -r choix
	case "$choix" in 
	        1) 
	            activeUser ;; 
	        2) 
	            desactiveUser ;; 
	        *) 
	            echo "Erreur de saisie"
	            echo
	            echo "Tapez sur la touche 'Entrer' pour continuer"
	            pause ;; 
	esac

fi
