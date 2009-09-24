#!/bin/bash

# MT-GitPub
# Copyright 2009 Al Shaw <almshaw@gmail.com> http://www.shhhaw.com
# GPL v3 http://www.gnu.org/copyleft/gpl.html

#####
# requires mt-rebuild http://appnel.com/code/mt-rebuild
# Create & fill out config.sh (or rename and modify config-sample.sh) before running this script.
######

#initialize config file. customize config.sh

configfile=$(dirname $0)/config.sh
source $configfile
trackmode=committed

# OPTIONS
# alternate config file						-c alt-config.sh
# use modified instead of committed			-m 

while getopts "c:m" OPTION
	do	
		case $OPTION in
			c)
				configfile=$(dirname $0)/$OPTARG
				source $configfile
			;;
			m)	trackmode=modified
			;;
		esac
	done

# get our mt files
files=$(awk '/indextmpl/ {print $2}' $configfile)
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

# change back to curdir

cd $CURDIR

#check to see if we want to publish any index templates


for file in ${changedfilesarr[@]}
do
	for mtfile in ${mtfilesarr[@]}
		
		do
			filename=`awk '/'"$mtfile"'/ {for(i=3;i<=(NF-1);i++){printf("%s ", $i)}print($NF)}' "$configfile"`

			if [ "X$mtfile" = "X$file" ]
				then
				 echo "i will publish $file ($filename) (index template) ($trackmode)"
				 perl $mtrebuild -mode="index" -blog_id="$blog_id" -template="$filename"
			fi
			
		done
				
done

