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


# genericize battery icons

FLINKS=`find -name "unity*" -type f`
SLINKS=`find -name "unity*" -type l`

for FLINK in $FLINKS;
do
    FRLINK="${FLINK/unity-/}"

    mv $FLINK $FRLINK
    ln -s $FRLINK $FLINK

    echo -e "ren  $FLINK  >  $FRLINK"
    echo -e "link $FLINK  >  $FRLINK"
done

echo -e ""

for SLINK in $SLINKS;
do
    SRLINK="${SLINK/unity-/}"
    SLLINK=$(readlink $SLINK)
    SLRLINK="${SLLINK/unity-/}"

    rm $SLINK
    ln -s $SLRLINK $SRLINK
    ln -s $SLRLINK $SLINK

    echo -e "ren  $SLRLINK  >  $SRLINK"
    echo -e "link $SLINK  >  $SLRLINK"
done


# fix broken symbolic links

rm battery_plugged.svg
ln -s ac-adapter-symbolic.svg battery_plugged.svg

rm unity-battery_plugged.svg
ln -s ac-adapter-symbolic.svg unity-battery_plugged.svg


#find broken symbolic links

LINKS=`find -type l`

for LINK in $LINKS;
do
    RL=`readlink $LINK`

    if [ ! -f $RL ]; then
        echo -e "link $LINK  >  $RL"
    fi
done


# add missing symbolic links

ln -s ac-adapter-symbolic.svg ac-adapter.svg

