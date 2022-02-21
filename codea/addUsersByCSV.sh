#!/bin/bash

while [[ condition ]]; do

	IFS=$OLDIFS

	echo "Saisir le chemin d'accès du fichier csv"
	read filecsv


	IFS=";"
	while read username comment expirationDate group
	do
		passtemp=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 8; echo)
		#pass=$(openssl passwd "$passtemp") 2>> opensslLog.txt
		pass=$(perl -e 'print crypt($ARGV[0], "passtemp")' $passtemp)

		if [ ! -n ${expirationDate} ]
		then useradd ${username} -p ${pass} -c "${comment}" -e ${expirationDate} > /dev/null

		elif [ ! -n ${comment} ]
		then useradd ${username} -p ${pass} -e ${expirationDate} > /dev/null

		else #[ ! -z ${comment} ] && [ ! -z ${expirationDate} ]
		useradd ${username} -p ${pass} > /dev/null

		fi
	       echo "Les Utilisateurs ont été créés correctement"
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