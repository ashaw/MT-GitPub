#!/bin/bash
# mt-rebuild-gitconfig.sh

# requires mt-rebuild http://appnel.com/code/mt-rebuild
# whereis mt-rebuild
# mt-rebuild="/var/www/vhosts/shhhaw.com/cgi-bin/mt/mt-rebuild.pl"

#initialize config file. customize config.sh

source $(dirname $0)/config.sh
trackmode=committed

# OPTIONS
# alternate config file						-c alt-config.sh
# use modified instead of committed			-m 

while getopts "c:m" OPTION
	do	
		case $OPTION in
			c)
				source $(dirname $0)/$OPTARG
			;;
			m)	trackmode=modified
			;;
		esac
	done

# get our changed files on last commit, and store in an array

CURDIR=`pwd`

cd $GITDIR

#use committed files 

if [ $trackmode = modified ];
	then
		changedfiles=$(git status | grep modified)
	else 
		if [ $trackmode = committed ]; 
			then
				changedfiles=$(git log -n 1 --name-only --pretty=format:)
		fi
fi

#unless you want to publish modified files. use -m
#while getopts "m" MODIFIED
#do
#	case $MODIFIED in
#		m)
#			changedfiles=$(git status | grep modified)
#		;;
#	esac
#done

changedfilesarr=( `echo $changedfiles` )

#check to see if we want to publish any index templates

for file in ${changedfilesarr[@]}
do
	for indexfile in ${index[@]}
		do
		
			if [ "X$indexfile" = "X$file" ]
				then
				 echo "i will publish $indexfile which is an index template"
			fi
		
		done
				
done
