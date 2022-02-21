#!/bin/bash

IFS=$OLDIFS

echo "Entrez le nom du fichier csv ou entrez retour pour annuler"
read filecsv

if [[ $filecsv == "retour" ]]; then

	echo
	echo "Ajout d'utilisateurs annulé"
	echo "Tapez 'entrer' pour continuer"

else

	IFS=";"
	while read username comment expirationDate group
	do
		passtemp=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8; echo)
		#pass=$(openssl passwd "$passtemp") 2>> opensslLog.txt
		pass=$(perl -e 'print crypt($ARGV[0], "passtemp")' $passtemp)

		if [ ! -n ${expirationDate} ]
		then useradd ${username} -p ${pass} -c "${comment}" -e ${expirationDate} -m > /dev/null

		elif [ ! -n ${comment} ]
		then useradd ${username} -p ${pass} -e ${expirationDate} -m > /dev/null

		else #[ ! -z ${comment} ] && [ ! -z ${expirationDate} ]
		useradd ${username} -p ${pass} -m > /dev/null

		fi
	       echo "$username à été créés avec succes"
	       echo ${username} ${passtemp} >> users.txt


		#echo Utilisateur $username créé #mdp $pass


	#ajouter dans un groupe

		IFS="/"
		for i in ${group}[
		do
			if [ $(getent group ${i}) ]
			then usermod -a -G ${i} ${username}
			else
				groupadd ${i}
				usermod -a -G ${i} ${username} 
			fi
		done
		IFS=";"
		echo "${username} dans le groupe ${i}" >> group.txt

	done <$filecsv

	echo
	echo "Tapez 'Entrer' pour continuer !"

fi
