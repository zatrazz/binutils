#!/bin/sh

# memory_seal_test.sh -- test GNU_PROPERTY_MEMORY_SEAL gnu property

# Copyright (C) 2018-2024 Free Software Foundation, Inc.

# This file is part of gold.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
# MA 02110-1301, USA.

# This script checks that after linking the three object files
# gnu_property_[abc].S, each of which contains a .note.gnu.property
# section, the resulting output has only a single such note section,
# and that the properties have been correctly combined.

check()
{
    if ! grep -q "$2" "$1"
    then
	echo "Did not find expected output in $1:"
	echo "   $2"
	echo ""
	echo "Actual output below:"
	cat "$1"
	exit 1
    fi
}

check memory_seal_test_1.stdout "memory seal"
check memory_seal_test_2.stdout "memory seal"

exit 0
