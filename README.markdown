# MT-GitPub

MT-GitPub is a bridge between Git and Tim Appnel's [mt-rebuild](http://appnel.com/code/mt-rebuild), a command line template rebuilder for Movable Type. MT-GitPub will find which templates you have just committed (or modified) and invoke mt-rebuild to just rebuild those templates. Good for iterative testing, or deploying changes to your live site.  

## Installation

Download and install mt-rebuild if you haven't already. Download mt-gitpub and `chmod 700 mt-gitpub.sh`. Rename config-sample.sh to config.sh and fill in paths to mt-rebuild, your Git repo and your blog id. Make a list of your templates according to the example (leave these lines commented to avoid runtime errors). I recommend setting up multiple config files for each blog you work on and calling them with `-c`. 

## Usage

To run in default mode, run `mt-gitpub.sh`.

By default, MT-GitPub will look for config.sh in the same directory and publish last-committed index templates. However, there are options:

Use an alternate config file `-c [configfilename]`

Publish last modified files rather than last committed `-m`

Right now, MT-GitPub only supports index templates.

## To Do

* add support for archive templates

* options -- only archives/only indexes

* create an easy config process that builds config.sh from mt database

* hook into mt-rebuild

* get into git post-commit hooks

## Bugs

* Template lists in config.sh interpreted as commands if left uncommented

* Errors on template modules (no output file)

## License

Copyright 2009 Al Shaw http://www.shhhaw.com

[GPL v3](http://www.gnu.org/copyleft/gpl.html)
