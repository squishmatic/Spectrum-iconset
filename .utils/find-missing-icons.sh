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

if [ "x$1" = "x" ]
then
    printf '\t%s\n' ""
    printf '\t%s\n\n' "Usage: find-missing-icons.sh [icons directory] [destination directory]"
    printf '\t%s\n' ""
    exit 1
fi

SRC=$([ $1 ] && echo $1 || echo ".")
SRC=$(realpath $SRC)
DST=$([ $2 ] && echo $2 || echo "found")
DST=$(realpath $DST)

mkdir -p $DST
cd $SRC

for APP in /usr/share/applications/*.desktop;
do
    ICONS=`grep "Icon=" $APP`

    for ICON in $ICONS;
    do
        ICON="${ICON/Icon=/}.svg"

        echo -e "${ICON}  ${APP}"

        ICOS=`find -name $ICON -type f -type l`

        for ICO in $ICOS;
        do
            echo -e "    ${ICO}"

            DIPO=`dirname $ICO`
            DIPO="${DST/.//}/${DIPO}"
            mkdir -p $DIPO
            cp $ICO $DIPO
        done
    done
done

