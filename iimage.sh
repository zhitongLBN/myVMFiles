#!/bin/sh

cat image | sed "s/name/\nname/g" | sed "s/language/\n/g"|grep name > iimage
