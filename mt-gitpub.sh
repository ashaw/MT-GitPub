#!/bin/bash

# MT-GitPub
# by Al Shaw <almshaw@gmail.com> http://www.shhhaw.com

# requires mt-rebuild http://appnel.com/code/mt-rebuild
# whereis mt-rebuild?
#mt-rebuild="/var/www/vhosts/shhhaw.com/cgi-bin/mt/mt-rebuild.pl"

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

#use modified or committed files?

if [ $trackmode = modified ];
	then
		changedfiles=$(git status | grep modified)
	else 
		if [ $trackmode = committed ]; 
			then
				changedfiles=$(git log -n 1 --name-only --pretty=format:)
		fi
fi


changedfilesarr=( `echo $changedfiles` )

#check to see if we want to publish any index templates

for file in ${changedfilesarr[@]}
do
	for indexfile in ${index[@]}
		
		do		
			if [ "X$indexfile" = "X$file" ]
				then
				 echo "i will publish $indexfile which is an index template"
				 #`perl $mt-rebuild -mode="index" -blog_id="$blog_id" -template="your template name"`
			fi
		
		done
				
done

