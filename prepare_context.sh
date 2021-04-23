#!/bin/bash

echo "REMEMBER, MUST RUN AS LOCAL USER"

if [ ! -d "nrg_improc" ]; then 
        echo git clone https://github.com/mmilch01/nrg_improc
        git clone https://github.com/mmilch01/nrg_improc
fi       

pushd nrg_improc &> /dev/null
        echo git pull
        git pull
popd &> /dev/null

nrg_tools=(add_license csh2bash impsc loc2xnat parse_impsc_log rcsv scans2xnat xlsx2csv.py xnat2loc xtolm xtolm.src)

for tool in ${nrg_tools[*]}; do
	cp -f nrg_improc/$tool .
done

