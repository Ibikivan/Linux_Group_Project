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
    echo
    printf "Tapez ici - " 
    read -r group 
} 
 
function userAdd { 
	passtemp=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8; echo)
	#pass=$(openssl passwd -crypt $passtemp) 2>> opensslLog.txt
    pass=$(perl -e 'print crypt($ARGV[0], "passtemp")' $passtemp)

    
    	if [ ! -n ${expirationDate} ]
    	then if useradd ${username} -p ${pass} -c "${comment}" -e ${expirationDate} -m >> useraddLog.txt 
    			then echo "utilisateur $username créé"
    		else echo "Error"
    		fi
    
    	elif [ ! -n ${comment} ]
    	then if useradd ${username} -p ${pass} -e ${expirationDate} -m >> useraddLog.txt
    			then echo "utilisateur $username créé"
    		else echo "Error"
    		fi
    
    	else 
    		if useradd ${username} --password ${pass} -m >> useraddLog.txt 
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
        echo
        echo "Tapez 'Entrer' pour continuer"
        echo "$username dans le groupe $group" >> group.txt
        
    else 
        echo "Le groupe n'existe pas, veuillez le créer d'abord"
        echo
        echo "Tapez 'Entrer' pour comtinuer"
    fi 
} 

echo
echo "entrez le nom d'utilisateur ou entrez 'retour' pour annuler"
echo
printf "Tapez ici - "
read username

if [[ $username == 'retour' ]]; then

    echo
    echo "Opération annulé !"
    echo "Tapez 'Entrer' pour continuer"

else

    if grep -i "^$username:" /etc/passwd > /dev/null; then 
        echo "L'utilisateur $username existe déjà" 
    else 

    echo
    echo "entrez un commentaire ou entrez 'retour' pour annuler"
    echo
    printf "Tapez ici - "
    read comment

        if [[ $comment == "retour" ]]; then
            
            echo
            echo "Opération annulé !"
            echo "Tapez 'Entrer' pour continuer"

        else

            echo
            echo "entrez une date d'expiration (AAAA-MM-JJ) ou entrez 'retour' pour annuler"
            echo
            printf "Tapez ici - "
            read expirationDate

            if [[ $expirationDate == "retour" ]]; then
                
                echo
                echo "Opération annulé !"
                echo "Tapez 'Entrer' pour continuer"

            else

                echo "Le mot de passe sera généré automatiquement"
                echo
                userAdd;

                echo
                echo "Voulez vous attribuer l'utilisateur à un groupe ?"
                echo
                echo "1. Oui"
                echo "2. NON"
                echo
                printf "Tapez ici - "

                read -r choix

                case "$choix" in 
                        1) 
                            getGroup 
                            verifyGroup ;; 
                        2) 
                            echo "Terminé"
                            echo
                            echo "Tapez la touche 'entrer' pour continuer"  
                            rep=0 ;; 
                        *) 
                            echo "Erreur de saisie" 
                            pause ;; 
                    esac

                echo "${username} ${passtemp}" >> users.txt
                #echo le compte de ${username} a été créé

            fi

        fi

    fi

fi
