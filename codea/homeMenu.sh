#!/bin/bash

while [[ true ]]; do
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
	echo "------------------------------SELECT LANGUAGE-------------------------------"
	echo
	echo

	if [[ "$choix" == "french" ]] ; then

		./home.sh

	elif [[ "$choix" == "english" ]]; then

		echo Anglais

	elif [[ "$choix" == "quitter" ]]; then
		
		clear
		break

	else

		echo "BIENVENUE DANS NOTRE PROGRAMME DE GESTION DES UTILISATEURS"
		echo "Veuillez choisir une langue de navigation"
		echo "saisisez 'french' pour le français ou 'english' pour l'anglais"
		echo "entrez 'quitter' pour quitter le programme"

	fi

	echo
	printf "Tapez ici - "
	read choix

	echo
	echo "En cours..."
	sleep 1
done