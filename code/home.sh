#!/bin/bash

function pause { 
    echo "Appuyez sur une touche pour continuer !" 
    read
}

function verifyUser { 
    if grep -i "^$userName:" /etc/passwd > /dev/null; then 
        echo
        echo
        echo "L'utilisateur $userName existe" 
    else 
        echo "L'utilisateur $userName n'existe pas" 
    fi 
    pause    
}

function getAllUsers { 
    awk -F: '{ print $1}' /etc/passwd     
}

function getAllGroups { 
    awk -F: '{ print $1}' /etc/group     
} 

function saisirUser { 
    echo "Saisir l'utilisateur" 
    read -r util 
} 

function addOne { 
    sudo code/./addOneUser.sh
}

function addUsers { 
    sudo code/./addUsersByCSV.sh
}

function addGroup {
    echo "fonction d'ajout manuel de groupe à developper"
    echo
	echo "Enrer le nom du groupe à créer"
	echo
	printf "Tapez ici - "
	read group
	if grep -i "^$group:" /etc/group > /dev/null
	then echo "Le groupe $group existe déjà"
	else
		if groupadd $group 
		then echo "Le groupe $group a été créé"
		else echo "Une erreur s'est produite"
		echo
		fi
	fi
    echo "Tapez la touche 'Entrer' pour continuer"
}

function deleteUser {
    sudo code/./delUser.sh
}

function activation { 
    sudo code/./changeStatusUser.sh
}

function saveData { 
    sudo code/./backup.sh 
}

function modCrontab { 
    sudo code/./modCrontab.sh
}

function Accueil {
    clear

    base64 -d <<<"DQogICAgICAuby4gICAgICAgb29vb29vICAgb29vb29vICAgICBvb29vICAub29vb29vLi5vICAg
ICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAuODg4LiAgICAgICBgODg4LiAgICBgODg4LiAg
ICAgLjgnICBkOFAnICAgIGBZOCAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAuOCI4ODgu
ICAgICAgIGA4ODguICAgLjg4ODguICAgLjgnICAgWTg4Ym8uICAgICAgICAgICAub29vb28uICAg
Lm9vb29vLiAgDQogICAuOCcgYDg4OC4gICAgICAgYDg4OCAgLjgnYDg4OC4gLjgnICAgICBgIlk4
ODg4by4gICAgICBkODgnIGAiWTggZDg4JyBgODhiIA0KICAuODhvb284ODg4LiAgICAgICBgODg4
LjgnICBgODg4LjgnICAgICAgICAgIGAiWTg4YiAgICAgODg4ICAgICAgIDg4OCAgIDg4OCANCiAu
OCcgICAgIGA4ODguICAgICAgIGA4ODgnICAgIGA4ODgnICAgICAgb28gICAgIC5kOFAgLm8uIDg4
OCAgIC5vOCA4ODggICA4ODggDQpvODhvICAgICBvODg4OG8gICAgICAgYDgnICAgICAgYDgnICAg
ICAgIDgiIjg4ODg4UCcgIFk4UCBgWThib2Q4UCcgYFk4Ym9kOFAnIA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCeSBHdXksIERlc3Rp
bm8sIE1hbm91ICYgUm9jaGUuLiB2IDEuMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIA0K"

    echo "////////////////////////////////////////////////////////////////////////////"
    echo
    echo "-------------------------------MENU PRINCIPAL-------------------------------"
    echo 
    echo "Bienvenue sur l'interface de GESTION de votre service."
    echo
    echo "                   Cette interface est un point de depart"
    echo "                 D'ici, vous pourrez suivre les étapes pour :"
    echo "                   Ajouter des utilisateurs et des groupes."
    echo "                 Gérer les utilisateurs et groupes existants."
    echo "   (Rechercher, Activer/Desactiver, Supprimer des utilisateurs et groupes."
    echo "      Effectuer quelques réglages de cette application et consulter les"
    echo "                                   Journeaux."
    echo
    echo "Saisissez les valeurs entre côtes ('') suivantes pour naviguer"
    echo "NB: respectez la case et accents ; toute valeur incorrecte sera rejettée"
    echo
    echo
}

function AjoutUtilisateurs {
    clear

    base64 -d <<<"DQogICAgICAuby4gICAgICAgb29vb29vICAgb29vb29vICAgICBvb29vICAub29vb29vLi5vICAg
ICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAuODg4LiAgICAgICBgODg4LiAgICBgODg4LiAg
ICAgLjgnICBkOFAnICAgIGBZOCAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAuOCI4ODgu
ICAgICAgIGA4ODguICAgLjg4ODguICAgLjgnICAgWTg4Ym8uICAgICAgICAgICAub29vb28uICAg
Lm9vb29vLiAgDQogICAuOCcgYDg4OC4gICAgICAgYDg4OCAgLjgnYDg4OC4gLjgnICAgICBgIlk4
ODg4by4gICAgICBkODgnIGAiWTggZDg4JyBgODhiIA0KICAuODhvb284ODg4LiAgICAgICBgODg4
LjgnICBgODg4LjgnICAgICAgICAgIGAiWTg4YiAgICAgODg4ICAgICAgIDg4OCAgIDg4OCANCiAu
OCcgICAgIGA4ODguICAgICAgIGA4ODgnICAgIGA4ODgnICAgICAgb28gICAgIC5kOFAgLm8uIDg4
OCAgIC5vOCA4ODggICA4ODggDQpvODhvICAgICBvODg4OG8gICAgICAgYDgnICAgICAgYDgnICAg
ICAgIDgiIjg4ODg4UCcgIFk4UCBgWThib2Q4UCcgYFk4Ym9kOFAnIA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCeSBHdXksIERlc3Rp
bm8sIE1hbm91ICYgUm9jaGUuLiB2IDEuMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIA0K"

    echo "////////////////////////////////////////////////////////////////////////////"
    echo
    echo "----------------------------AJOUT D'UTILISATEURS----------------------------"
    echo 
    echo "Bienvenue sur notre interface de GESTION des utilisateurs de votre service."
    echo
    echo
    echo
    echo "Nous allons maintenant crééer des utilisateurs via de votre fichier."
    echo "Veillez saisir le nom de votre fichier (.csv) ou 'annuler'"
    echo
}


#Début du programme proprement dit
#Cette boucle while maintient l'affichage du menu et des options de base
#//////////////////////////////////////////////////////////////

while [[ true ]]; do 
    
    #Appel de la fonction qui affiche le logo et déchit l'interface
    #----------------------------------------------------------
    Accueil

    
    if [[ "$choix" == "a" ]]; then

        #Cette boucle maintient dans le sous menu de choix d'ajout
        #------------------------------------------------------ 
        while [[ true ]]; do
            
            Accueil

            if [[ $choix == "u" ]]; then

                #choisir de la methode d'ajout des users
                #----------------------------------------------
                while [[ true ]]; do
            
                    Accueil

                    if [[ $choix == "a" ]]; then
                
                        #on fait appel à la fonction d'ajout automatique
                        #il faudra la mettre à jour dans son script
                        #-----------------------------------------
                        addUsers

                    elif [[ $choix == "m" ]]; then
                
                        #Ajout d'utilisateurs en manuel
                        #--------------------------------------
                        addOne

                    elif [[ $choix == "r" ]]; then
                
                        echo "Tapez 'Entrer' pour continuer"
                        break

                    else

                        #en cas d'erreur de saisie ce code s'exécute
                        #----------------------------------------
                        echo "  Saisissez 'a' pour Ajouter des utilisateurs via un fichier csv"
                        echo "  Saisissez 'm' pour Ajouter manuellement un utilisateur"
                        echo "  Saisissez 'r' pour Retour en arrière"

                    fi

                    echo
                    printf "Tapez ici - "
                    read choix

                    echo
                    echo "en cours..."
                    sleep 1

                done

            elif [[ $choix == "g" ]]; then
                
                #Ajout manuel de groupe
                #fonction en cours de confection, à ajouter
                #------------------------------------------------
                addGroup

            elif [[ $choix == "r" ]]; then
                
                echo "Tapez 'Entrer' pour continuer"
                break

            else

                #En cas d'erreur de saisie au niveau du choix du type d'ajout
                #--------------------------------------------------
                echo "  Saisissez 'u' pour Ajouter des utilisateurs"
                echo "  Saisissez 'g' pour Ajouter des groupes"
                echo "  Saisissez 'r' pour revenir en arrière"

            fi

            echo
            printf "Tapez ici - "
            read choix

            echo
            echo "en cours..."
            sleep 1

        done

    elif [[ "$choix" == "gt" ]]; then

        #Cette boucle bloque et recupère les option de gestion utilisateur
        #----------------------------------------------------------
        while [[ true ]]; do
            
            Accueil

            if [[ $choix == "u" ]]; then
                
                while [[ true ]]; do
                    
                    Accueil

                    getAllUsers

                    if [[ $choix == "seach" ]]; then
                        
                        echo
                        echo "Veuillez entrer le nom de l'utilisateur à rechercher"
                        read userName

                        verifyUser

                    elif [[ $choix == "status" ]]; then
                        
                        activation

                    elif [[ $choix == "del" ]]; then
                        
                        echo
                        deleteUser

                    elif [[ $choix == "retour" ]]; then
                        
                        echo
                        echo "Tapez 'Entrer' pour continuer"
                        break

                    else

                        echo
                        echo
                        echo "Recherche utilisateur: 'seach' ; Suppression utilisateur: 'del'"
                        echo "Activer/Desactiver utilisateur: status ; revenir en arrière: 'retour'"

                    fi

                    echo
                    printf "Tapez ici - "
                    read choix

                    echo
                    echo "En cours..."
                    sleep 1

                done

            elif [[ $choix == "g" ]]; then
                
                while [[ true ]]; do
                    
                    Accueil

                    getAllGroups

                    if [[ $choix == "seach" ]]; then
                        
                        echo
                        echo "Veuillez entrer le nom du groupe à rechercher"
                        read group

                        #Fonction à crééer et ajouter
                        #--------------------------------------
                        #verifyGroup
                        echo "Le groupe $group ne peut être géré actuellement"
                        echo "car la fonctionnalité est en cour de développement"
                        echo "Merci d'attendre la version 2.0 de notre application"

                    elif [[ $choix == "userGroup" ]]; then
                        
                        echo "on affiche les utilisateurs du groupe"
                        echo
                        echo "La fonctionnalité $choix est en cour de développement"
                        echo "Merci d'attendre la version 2.0 de notre application"

                    elif [[ $choix == "del" ]]; then
                        
                        echo "on supprime le groupe"
                        echo
                        echo "la fonctionnalité $choix est en cour de développement"
                        echo "Merci d'attendre la version 2.0 de notre application"

                    elif [[ $choix == "retour" ]]; then
                        
                        echo
                        echo "Tapez 'Entrer' pour continuer"
                        break

                    else

                        echo
                        echo
                        echo "Recherche groupe: 'seach' ; Suppression groupe: 'del'"
                        echo "afficher les utilisateurs: 'userGroup' ; retour en arrière: 'retour'"

                    fi

                    echo
                    printf "Tapez ici - "
                    read choix

                    echo
                    echo "En cours..."
                    sleep 1

                done

            elif [[ $choix == "r" ]]; then
                
                echo "Tapez 'Entrer' pour continuer !"
                break

            else

                echo "Voulez-vous gérer les utilisateurs ou les groupes ?"
                echo "  Saisissez 'u' pour Gerer les utilisateurs"
                echo "  Saisissez 'g' pour gerer les groupes"
                echo "  Saisissez 'r' revenir en arièrre"

            fi

            echo
            printf "Tapez ici - "
            read choix

            echo
            echo "En cours..."
            sleep 1

        done
        # Je vais reproduire cette structure à travers les différentes couches du programme jusqu'à ce que je doivent appeler une fonction.

    elif [[ "$choix" == "p" ]]; then

        #Boucle de blocage dans les paramètres
        #---------------------------------------------------------
        while [[ true ]]; do
            
            Accueil

            if [[ $choix == "mc" ]]; then
                
                #Fonction pour modifier le chron
                #------------------------------------------------
                modCrontab

            elif [[ $choix == "lg" ]]; then
                
                echo "afficher les logs d'erreur"
                echo
                echo "La fonctionnalité $choix est en cour de développement"
                echo "Merci d'attendre la version 2.0 de notre application"

            elif [[ $choix == "saves" ]]; then
                
                echo "on affiche les archives des utilisateurs supprimés"
                echo "La fonctionnalité $choix est en cour de développement"
                echo "Merci d'attendre la version 2.0 de notre application"

            elif [[ $choix == "r" ]]; then
                
                echo "Tapez 'Entrer' pour continuer"
                break

            else

                echo "  Saisissez 'mc' pour Modifier le delais de sauvegarde"
                echo "  Saisissez 'lg' Pour afficher les journneaux d'erreur"
                echo "  Saisissez 'saves' pour visualiser les Archives des utilisateurs supprimés"
                echo "  Saisissez 'r' pour revenir en arrière"

            fi

            echo
            printf "Tapez ici - "
            read choix

            echo
            echo "En cours..."
            sleep 1

        done

    elif [[ "$choix" == "r" ]]; then

        echo "tapez la touche 'Entrer' pour continuer"
        break

    else

        #En cas d'erreur de saisie au niveau du menu principal
        #---------------------------------------------------------
        echo "  Saisissez 'a' pour Ajouter utilisateurs/groupes"
        echo "  Saisissez 'gt' pour la gestion des utilisateurs/groupes"
        echo "  Saisissez 'p' pour acceder aux Paramètres et journneaux"
        echo "  Saisissez 'r' pour reculer au choix de langue"

    fi

    echo
    printf "Tapez ici - "
    read choix

    echo
    echo "En cours..."
    sleep 1

done
