#!/bin/bash

function desactiveUser {
	if [ grep -i "^$username:" /etc/passwd > /dev/null ]; 
then
	echo "Le compte d'utilisateur $username va être désactivé" 
    if [ sudo passwd -l $username ];
	then
		echo "Utilisateur désactivé"
	else
		echo "une erreur s'est produite"
	fi
else
	echo "L'utilisateur $username n'existe pas"
fi
}

function activeUser {
	if [ grep -i "^$username:" /etc/passwd > /dev/null ]; 
then
	echo "Le compte d'utilisateur $username va être activé" 
    if [ sudo passwd -u $username ];
	then
		echo "Utilisateur activé"
	else
		echo "Une erreur s'est produite"
	fi
else
	echo "L'utilisateur $username n'existe pas"
fi
}
read -p "Entrer le nom d'utilisateur" username
echo
echo "Quelle action voulez vous effectuer ?"
echo
echo "1. Activer le compte"
echo "2. Désactiver le compte"
read -r choix
case "$choix" in 
        1) 
            activeUser ;; 
        2) 
            desactiveUser ;; 
        *) 
            echo "Erreur de saisie" 
            pause ;; 
esac