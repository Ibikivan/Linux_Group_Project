#!/bin/bash

#function verifyUser { 
#    if grep -i "^$username:" /etc/passwd > /dev/null; then 
#        echo "L'utilisateur existe déjà" 
#    else 
#         echo 
#    fi 
    #pause    
#} 


function getGroup { 
    echo "Saisir le nom du groupe" 
    read -r group 
} 
 
function userAdd { 
	passtemp=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8; echo)
	#pass=$(openssl passwd -crypt $passtemp) 2>> opensslLog.txt
    pass=$(perl -e 'print crypt($ARGV[0], "passtemp")' $passtemp)

    
    	if [ ! -n ${expirationDate} ]
    	then if useradd ${username} -p ${pass} -c "${comment}" -e ${expirationDate} >> useraddLog.txt 
    			then echo "utilisateur $username créé"
    		else echo "Error"
    		fi
    
    	elif [ ! -n ${comment} ]
    	then if useradd ${username} -p ${pass} -e ${expirationDate} >> useraddLog.txt
    			then echo "utilisateur $username créé"
    		else echo "Error"
    		fi
    
    	else 
    		if useradd ${username} --password ${pass} >> useraddLog.txt 
    			then echo "utilisateur $username créé"
    		else echo "Error"
    		fi
    
    	fi
    }

function verifyGroup { 
    if grep -i "^$group:" /etc/group > /dev/null; then 
        echo "Le groupe $group existe"
        echo
        usermod -a -G ${group} ${username} 
        echo "l'utilisateur $username a été ajouté au groupe $group" 
        echo "$username dans le groupe $group" >> group.txt
        
    else 
        echo "Le groupe n'existe pas, veuillez le créer d'abord"
    fi 
} 

echo "entrez le nom d'utilisateur"
read username

if grep -i "^$username:" /etc/passwd > /dev/null; then 
    echo "L'utilisateur $username existe déjà" 
else 

echo "entrez un commentaire"
read comment

echo "entrez une date d'expiration (AAAA-MM-JJ)"
read expirationDate

echo "Le mot de passe sera généré automatiquement"
echo
userAdd;

echo
echo "Voulez vous attribuer l'utilisateur à un groupe ?"
echo
echo "1. Oui"
echo "2. NON"

read -r choix

case "$choix" in 
        1) 
            getGroup 
            verifyGroup ;; 
        2) 
            echo "OK"  
            rep=0 ;; 
        *) 
            echo "Erreur de saisie" 
            pause ;; 
    esac

echo "${username} ${passtemp}" >> users.txt
#echo le compte de ${username} a été créé
fi