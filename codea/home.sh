#!/bin/bash

function pause { 
    echo "Press any key to continu !" 
    read
}

function verifyUser { 
    if grep -i "^$userName:" /etc/passwd > /dev/null; then 
        echo
        echo
        echo "The user $userName exists" 
    else 
        echo "The user $userName does not exist" 
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
    echo "Enter user" 
    read -r util 
} 

function addOne { 
    sudo ./addOneUser.sh
}

function addUsers { 
    sudo ./addUsersByCSV.sh
}

function addUser { 
    sudo ./changeStatusUser.sh
}

function saveData { 
    sudo ./backup.sh 
}

function modCron { 
    sudo ./modCrontab.sh
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
    echo "-------------------------------MAIN MENU-------------------------------"
    echo 
    echo "Welcome to our service user management interface."
    echo
    echo "This interface is a starting point"
    echo "From here you can follow the steps to :"
    echo "*.    Add the users and the groups."
    echo "*.    Manage existing users and groups."
    echo "      (Search, enable/disable, delete users and groups)."
    echo "*.    Make some settings of this application and consult"
    echo "      the logs."
    echo
    echo
    echo "Enter the values between the following ('') dimensions to navigate"
    echo "NB: respect case and accents; any incorrect value will be rejected"
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
    echo "----------------------------ADD USERS----------------------------"
    echo 
    echo "Welcome to our service user management interface."
    echo
    echo
    echo
    echo "We will now create users via your file."
    echo "Please entre the name of your file (.csv) or 'cancel'"
    echo
}


#Début du programme proprement dit
#Cette boucle while maintient l'affichage du menu et des options de base
#//////////////////////////////////////////////////////////////

while [[ true ]]; do 
    
    #Appel de la fonction qui affiche le logo et déchit l'interface
    #----------------------------------------------------------
    Accueil

    
    if [[ "$choix" == "add" ]]; then

        #Cette boucle maintient dans le sous menu de choix d'ajout
        #------------------------------------------------------ 
        while [[ true ]]; do
            
            Accueil

            if [[ $choix == "user" ]]; then

                #choisir de la methode d'ajout des users
                #----------------------------------------------
                while [[ true ]]; do
            
                    Accueil

                    if [[ $choix == "auto" ]]; then
                
                        #on fait appel à la fonction d'ajout automatique
                        #il faudra la mettre à jour dans son script
                        #-----------------------------------------
                        addUsers

                    elif [[ $choix == "manuel" ]]; then
                
                        #Ajout d'utilisateurs en manuel
                        #--------------------------------------
                        addOne

                    elif [[ $choix == "retour" ]]; then
                
                        echo "Hit 'Enter' to continue"
                        break

                    else

                        #en cas d'erreur de saisie ce code s'exécute
                        #----------------------------------------
                        echo "Add via file: 'auto' ; Ajouter manually : 'manuel'"
                        echo "                 Back to menu: 'back'"

                    fi

                    echo
                    printf "Type here - "
                    read choix

                    echo
                    echo "in progress..."
                    sleep 1

                done

            elif [[ $choix == "group" ]]; then
                
                #Ajout manuel de groupe
                #fonction en cours de confection, à ajouter
                #------------------------------------------------
                addGroup

            elif [[ $choix == "retour" ]]; then
                
                echo "Type 'Enter' for continue"
                break

            else

                #En cas d'erreur de saisie au niveau du choix du type d'ajout
                #--------------------------------------------------
                echo "Add the user: 'user' ; Add the group : 'group'"
                echo "                 Back to the menu: 'back'"

            fi

            echo
            printf "Type here - "
            read choix

            echo
            echo "in progress..."
            sleep 1

        done

    elif [[ "$choix" == "manage" ]]; then

        #Cette boucle bloque et recupère les option de gestion utilisateur
        #----------------------------------------------------------
        while [[ true ]]; do
            
            Accueil

            if [[ $choix == "userlst" ]]; then
                
                while [[ true ]]; do
                    
                    Accueil

                    getAllUsers

                    if [[ $choix == "seach" ]]; then
                        
                        echo
                        echo "Please enter the name of the user to search"
                        read userName

                        verifyUser

                    elif [[ $choix == "active" ]]; then
                        
                        echo "activate the user"

                    elif [[ $choix == "disactive" ]]; then
                        
                        echo "desactivate the user"

                    elif [[ $choix == "del" ]]; then
                        
                        echo "delete the user"

                    elif [[ $choix == "retour" ]]; then
                        
                        echo
                        echo "Type 'Enter' for continue"
                        break

                    else

                        echo
                        echo
                        echo "Search the user: 'seach' ; delete the user: 'del'"
                        echo "Activate users: active ; Disactive users: 'disactive'"
                        echo "                  go back: 'back'"

                    fi

                    echo
                    printf "Type here - "
                    read choix

                    echo
                    echo "In progress..."
                    sleep 1

                done

            elif [[ $choix == "grouplst" ]]; then
                
                while [[ true ]]; do
                    
                    Accueil

                    getAllGroups

                    if [[ $choix == "seach" ]]; then
                        
                        echo
                        echo "Please enter the name of the group  to search"
                        read userName

                        #Fonction à crééer et ajouter
                        #--------------------------------------
                        verifyGroup

                    elif [[ $choix == "userGroup" ]]; then
                        
                        echo "on affiche les utilisateurs du groupe"
                        echo "comming soon..."

                    elif [[ $choix == "del" ]]; then
                        
                        echo "on supprime le groupe"

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

            elif [[ $choix == "retour" ]]; then
                
                echo "Tapez 'Entrer' pour continuer !"
                break

            else

                echo "Voulez-vous gérer les utilisateurs ou les groupes ?"
                echo "Gerer les utilisateurs: 'userlst' ; gerer les groupes: 'grouplst'"
                echo "                 revenir en arièrre: retour"

            fi

            echo
            printf "Tapez ici - "
            read choix

            echo
            echo "En cours..."
            sleep 1

        done
        # Je vais reproduire cette structure à travers les différentes couches du programme jusqu'à ce que je doivent appeler une fonction.

    elif [[ "$choix" == "set" ]]; then

        #Boucle de blocage dans les paramètres
        #---------------------------------------------------------
        while [[ true ]]; do
            
            Accueil

            if [[ $choix == "mchron" ]]; then
                
                #Fonction pour modifier le chron
                #------------------------------------------------
                modCron

            elif [[ $choix == "log" ]]; then
                
                echo "afficher les logs d'erreur"

            elif [[ $choix == "saves" ]]; then
                
                echo "on affiche les archives des utilisateurs supprimés"

            elif [[ $choix == "retour" ]]; then
                
                echo "Tapez 'Entrer' pour continuer"
                break

            else

                echo "Modifier le Chron: 'mchron' ; Afficher le Log: 'log'"
                echo "Archives utilisateurs supprimés: 'saves' ; Retour: 'retour'"

            fi

            echo
            printf "Tapez ici - "
            read choix

            echo
            echo "En cours..."
            sleep 1

        done

    elif [[ "$choix" == "back" ]]; then

        echo "tapez la touche 'Entrer' pour continuer"
        break

    else

        #En cas d'erreur de saisie au niveau du menu principal
        #---------------------------------------------------------
        echo "Add users/groups: 'add' ; management users/groups : 'manage'"
        echo "         Settings and logs: 'set' ; to move back: 'back'"

    fi

    echo
    printf "Type here - "
    read choix

    echo
    echo "In progress..."
    sleep 1

done
