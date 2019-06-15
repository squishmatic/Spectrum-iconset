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
    printf '\t%s\n\n' "Usage within the context icon theme directory:"
    printf '\t%s\n\n' " link-scalable-symbolic.sh [directory size(s)] ..."
    printf '\t%s\n' ""
    exit 1
fi

for SIZE in "$@";
do
    echo -e "${SIZE}"
    mkdir -p $SIZE
    cd $SIZE

    for FILE in ../symbolic/*.svg;
    do
        FILENAME=`basename $FILE`
        ln -s $FILE "${FILENAME/-symbolic/}" 
        echo -e "${FILE}  ${FILENAME/-symbolic/}"
    done

    cd ..
done
