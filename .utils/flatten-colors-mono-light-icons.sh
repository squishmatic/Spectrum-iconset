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

for ICON in $ICONS; do
    sed 's/'#3c3c3c'/'#000000'/g' $ICON > "${ICON/.svg/_edit}.svg"
    rm $ICON
    mv "${ICON/.svg/_edit}.svg" $ICON

    echo -e "edit ${ICON}"
done

