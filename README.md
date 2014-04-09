normalize.sh
============

Version 1.0

Bash script to separate <a href="https://github.com/necolas/normalize.css/blob/master/normalize.css">normalize.css</a> into sass partials

Setup just requires downloading the script or cloning the repo and ensuring it is executable. 

 cd ~ <br/>
 Clone this github repository <br/>
 cd ~/normalize.sh <br/>
 ~/normalize.sh  (May require sudo)<br/>

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

The script uses regular expressions to take sections from normalize.css which can save some setup time on new projects. Since the script looks for keywords to take blocks, major updates to normalize.css will likely result in unintentional output to .scss files.
