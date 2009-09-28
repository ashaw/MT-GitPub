#!/bin/bash

# MT-GitPub Setup

#configfilename=dummy-config.sh
#get $configfilename from -setup arg in mt-gitpub.sh

# Get our db vars
echo -n "Where is mt-rebuild? "
read mtrebuildpath
echo -n "Where is your Git repo? "
read gitdirpath
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

echo "#mt-gitpub config" > $configfilename
echo "#generated on `date +%Y-%m-%d`" >> $configfilename
echo "" >> $configfilename

echo "#path to mt-rebuild in mt directory" >> $configfilename
echo "mtrebuild=\"$mtrebuildpath\"" >> $configfilename
echo "" >> $configfilename

echo "# git directory of blog you want to track" >> $configfilename
echo "GITDIR=$gitdirpath" >> $configfilename
echo "" >> $configfilename

echo "blog_id=\"$blog_id\"" >> $configfilename

echo "select template_linked_file, template_name from mt_template where template_type='index' AND template_blog_id='$blog_id'" | mysql -u $usr -p$pw $db | tail -n+2 | awk '{gsub(/^.*\//, "", $1); printf("#indextmpl " $1 " "); for (i=2;i<=NF;i++){printf("%s ", $i)} print "\n"}' >> $configfilename

echo ""
echo "***** your config file ($configfilename) *****"

cat $configfilename

echo ""