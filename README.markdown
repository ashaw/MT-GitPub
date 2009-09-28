# MT-GitPub

MT-GitPub is a bridge between Git and Tim Appnel's [mt-rebuild](http://appnel.com/code/mt-rebuild), a command line template rebuilder for Movable Type. MT-GitPub will find which templates you have just committed (or modified) and invoke mt-rebuild to just rebuild those templates. Good for iterative testing, or deploying changes to your live site.  

## Installation

Note, this is unstable pre-alpha software. Use at your own risk.

Download and install mt-rebuild if you haven't already. Download mt-gitpub and `chmod 700 mt-gitpub.sh`. Make sure all the templates you'd like to be able to publish are linked to a file in the MT application.

Setup a config file by running MT-GitPub in setup mode: `bash mt-gitpub.sh -s [configfilename]`. If this is your first configfile, use `config.sh` as your filename, as that is the default MT-GitPub will look for when publishing templates. Answer the questions-- the setup script will query your MT database to find all of your linked index templates for a given blog_id.

If you'd like to fill in your config file manually, rename config-sample.sh to config.sh and fill in paths to mt-rebuild, your Git repo and your blog id. Make a list of your templates according to the example (leave these lines commented to avoid runtime errors). 

I recommend setting up multiple config files (either manually or with `-s` for each blog you work on and calling them with `-c`. 

## Usage

To run in default mode, run `bash mt-gitpub.sh`.

By default, MT-GitPub will look for config.sh in the same directory and publish last-committed index templates. However, there are options:

Use an alternate config file `-c [configfilename]`

Publish last modified files rather than last committed `-m`

Set up a new config file `-s [configfilename]`. It will generate the config file in the same directory, which you can call later with `-c`. This option will not do any publishing.

Right now, MT-GitPub only supports index templates.

## To Do

* Default `-s` to config.sh rather than making you manually type in desired filename

* add support for archive templates

* options -- only archives/only indexes

* get into git post-commit hooks

## Bugs

* Template lists in config.sh interpreted as commands if left uncommented

* Errors on template modules (no output file)

## License

Copyright 2009 Al Shaw http://www.shhhaw.com

[GPL v3](http://www.gnu.org/copyleft/gpl.html)
