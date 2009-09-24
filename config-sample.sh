# mt-gitpub config

#####
# rename this file config.sh and put in the same directory as mt-gitpub.sh
# or invoke an alternate config file with the -c flag
# requires mt-rebuild http://appnel.com/code/mt-rebuild
# Put mt-rebuild in your mt directory, then provide the path
#
mtrebuild="/path/to/mt/mt-rebuild.pl"
#
######

# git directory of blog you want to track
GITDIR=/path/to/gitrepo

# define blog id
# blog_id="1"

blog_id="1"

# define index templates and archive templates like so
# (leave comment hashes)
#
# #indextmpl filename template title
#

#indextmpl index.mtml main index
#indextmpl style.css style
#indextmpl atom.mtml atom
