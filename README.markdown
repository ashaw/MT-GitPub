# MT-GitPub

## Installation

Download and install mt-rebuild if you haven't already. Download mt-gitpub and `chmod +x mt-gitpub.sh`. Open mt-gitpub.sh and fill in the path to mt-rebuild. Open config.sh and fill in paths to your Git repo and your blog id. Fill in the index and archive arrays with your template filenames. I recommend setting up multiple config files for each blog you work on. 

## Usage

To run in default mode, run `mt-gitpub.sh`.

By default, MT-GitPub will look for config.sh in the same directory and publish last-committed index templates. However, there are options:

Use an alternate config file `-c [configfilename.sh]`

Publish last modified files rather than last committed `-m`

## To Do

* add support for archive templates

* options -- only archives/only indexes

* hook into mt-rebuild

* get into git post-commit hooks

## Me

Al Shaw

http://www.shhhaw.com