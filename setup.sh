#!/bin/bash

# MT-GitPub Setup

# Get our db vars
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

mysql -u $usr -p$pw -s -e 'select template_name, template_linked_file from mt_template where template_type="index" AND template_blog_id="3"' 

#$db; > tables.txt
