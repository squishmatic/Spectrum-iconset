#!/bin/bash
#
#  Copyright (C) 2019 Squishmatic project team <project@squishmatic.com>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, see <http://www.gnu.org/licenses>.
#


ICONS=`find -name *.svg -type f`


# automatic substitution

for ICON in $ICONS; do
    perl -pe "s/opacity:0.3;(.*)(fill|stroke):#000000;/opacity:0;\1\2:#000000;/g" $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON

    perl -pe "s/(fill|stroke):#000000;(.*)opacity:0.3/\1:#000000;\2opacity:0/g" $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON


    perl -pe "s/(fill|stroke):#000000;(.*)opacity:0.29803922/\1:#000000;\2opacity:0/g" $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON


    perl -pe "s/opacity:0.29999999999999999;(.*)(fill|stroke):#000000;/opacity:0;\1\2:#000000;/g" $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON

    perl -pe "s/(fill|stroke):#000000;(.*)opacity:0.29999999999999999/\1:#000000;\2opacity:0/g" $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON


    perl -pe "s/opacity:0.3;(.*)(fill|stroke):#df382c;/\1:opacity:0;\1\2:#df382c;/g" $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON

    perl -pe "s/opacity:0.3;(.*)(fill|stroke):#dfdbd2;/\1:opacity:0;\1\2:#dfdbd2;/g" $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON


    echo -e "edit ${ICON}"
done


echo -e ""


# candidates for manual substitution

for ICON in $ICONS; do
    if [[ `grep "opacity:0.3" $ICON` ]]; then
        echo -e "${ICON}"
    fi

    if [[ `grep "opacity:0.29803922" $ICON` ]]; then
        echo -e "${ICON}"
    fi

    if [[ `grep "opacity:0.29999999999999999" $ICON` ]]; then
        echo -e "${ICON}"
    fi
done

