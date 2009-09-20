#!/bin/bash

#mt-gitpub config

# git directory of blog you want to track
GITDIR=/Applications/MAMP/htdocs/git/mt-shhhaw-theme

# define blog id
# blog_id="1"

blog_id="1"

# define index templates and archive templates like so
# 
# indextmpl=(
#	templatefilename
#   template title in MT
#	[...]
#  )
#

indextmpl=(

index.mtml
index
style.css
styles
atom.mtml
atom
the-archive.mtml 
full archive
module-head.mtml
header module

)

archive=(

entry.mtml 
page.mtml

)