#!/bin/bash

# A bash script to separate normalize.css into sass partials
# Written by Rob Abbe
# 4/8/2014

echo -n "Enter project name: "
read Project
if [ -z "$Project" ];
  then
    echo "$0 requires the name of a project. Example: New_project"
      else

#Initialize folders and files
	
#Add more files to this array and they will be created with the header

        Files=(base forms grid headings links lists media tables typography utility)

        S_User=$(env | grep SUDO_USER | cut -d"=" -f2)
	Base=/home/${S_USER}/${Project}/base
        mkdir -p "$Base"
	cd $Base
        touch "_${Files[@]/%/.scss}"
        chown -R ${S_User}:${S_User} ~/${Project}

         for i in "${Files[@]}"
           do
             echo "/* ==========================================================================" >> ${Base}/_${i}.scss
             echo "   ${i^}" >> ${Base}/_${i}.scss
             echo "   ========================================================================== */" >> ${Base}/_${i}.scss
             echo -e "\n" >> ${Base}/_${i}.scss
          done

#Get latest normalize.css
	wget -O ~/normalize.css https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css

#Extract specific information to each file:

#base
  echo "\**" >> $Base/_base.scss
  tail -n +2 ~/normalize.css | sed -n "/san/,/HTML5/p" | head -n -1 >> $Base/_base.scss

#forms
  tail -n +2 ~/normalize.css | sed -n "/Forms/,/Tables/p" | head -n -1 | tail -n +3 >> $Base/_forms.scss

#tables
  tail -n +2 ~/normalize.css | sed -n '/Tables/,$p' | tail -n +3 >> $Base/_tables.scss

#links
  tail -n +2 ~/normalize.css | sed -n "/Links/,/Text-level/p" | head -n -1 | tail -n +3 >> $Base/_links.scss

#media
  tail -n +2 ~/normalize.css | sed -n "/Embedded/,/Forms/p" | head -n -1 | tail -n +3 >> $Base/_media.scss

#typography
  tail -n +2 ~/normalize.css | sed -n "/Grouping/,/Forms/p" | head -n -1 | tail -n +3 >> $Base/_typography.scss

fi


