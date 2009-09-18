#!/bin/bash
# mt-rebuild-gitconfig.sh

# requires mt-rebuild http://appnel.com/code/mt-rebuild
# whereis mt-rebuild
# mt-rebuild="/var/www/vhosts/shhhaw.com/cgi-bin/mt/mt-rebuild.pl"

# define blog id
# blog_id="1"

blog_id="1"

# map filenames to template names

index=(index.mtml style.css atom.mtml the-archive.mtml module-head.mtml)

archive=(entry.mtml page.mtml)

# get our changed files on last commit, and store in an array

CURDIR=`pwd`
GITDIR=/Applications/MAMP/htdocs/git/mt-shhhaw-theme

cd $GITDIR

changedfiles=$(git log -n 1 --name-only --pretty=format:)

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
