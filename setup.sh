#!/bin/bash

# MT-GitPub Setup

configfilename=dummy-config.sh

# Get our db vars
echo -n "Where is mt-rebuild? "
read mtrebuildpath
echo -n "Enter db username: "
read usr
echo -n "Enter db password *not stored*: "
stty -echo
read pw
stty echo
echo ""
echo -n "Enter db name: "
read db
echo -n "Enter blog_id: "
read blog_id

#db="mt4"
#usr=""
#pw=""
#blog_id="3"
#mtrebuildpath

#query=`mysql -u $usr -p$pw -s -e "use $db; select template_name, #template_linked_file from mt_template where template_type='index' AND #template_blog_id='$blog_id'"` 

#for line in $query ;
#	do 
#   	echo $line 
#	done
#	
#"$query" > tables.txt

echo "#mt-gitpub config" > $configfilename
echo "#generated on `date +%Y-%m-%d`" >> $configfilename
echo "" >> $configfilename

echo "#path to mt-rebuild in mt directory" >> $configfilename
echo "mtrebuild=\"$mtrebuildpath\"" >> $configfilename
echo "" >> $configfilename

echo "blog_id=\"$blog_id\"" >> $configfilename

echo "select template_linked_file, template_name from mt_template where template_type='index' AND template_blog_id='$blog_id'" | mysql -u $usr -p$pw $db | tail -n+2 | awk '{gsub(/^.*\//, "", $1); print "#indextmpl "  $1, $2, $3}' >> $configfilename

echo "***** your config file ($configfilename) *****"

cat $configfilename