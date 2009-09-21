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

# get our mt files
files=$(awk "/indextmpl/ {print $2}" /Applications/MAMP/htdocs/git/mt-gitpub/config.sh)
mtfilesarr=( `echo $files` ) 

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
	for mtfile in ${mtfilesarr[@]}
		
		do
			#filename=$(awk '/$mtfile/ {print $3}' config.sh)
			filename=`awk '/'"$mtfile"'/ {print $3}' /Applications/MAMP/htdocs/git/mt-gitpub/config.sh`

			if [ "X$mtfile" = "X$file" ]
				then
				 echo "i will publish $file ($filename) (index template) ($trackmode)"
				 
				 #`perl $mt-rebuild -mode="index" -blog_id="$blog_id" -template="your template name"`
			fi
			
		done
				
done

