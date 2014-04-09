normalize.sh
============

Version 1.0

Bash script to separate normalize.css into sass partials

Sudo may be required for commands, or to run the script itself.

cd ~
Clone this github repository
chmod 744 ~/normalize.sh
~/normalize.sh 

You enter a project name, it creates ~/$Project/base, with the following files:

_base.scss  
_forms.scss  
_grid.scss  
_headings.scss  
_links.scss 
_lists.scss  
_media.scss  
_tables.scss  
_typography.scss  
_utility.scss

The script uses regular expressions to take chunks so there may be issues when normalize.css updates.
