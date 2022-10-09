#!/bin/bash

GREEN="\e[1;97;92m"
Gcyan="\e[1;97;93m"
Cyan="\e[1;97;96m"
STOP="\e[0m"
echo -e $Gcyan'''
    _______       ______   
   / ____(_)___  / ____/  __
  / /_  / / __ \/ __/ | |/_/
 / __/ / / / / / /____>  <  
/_/   /_/_/ /_/_____/_/|_|  
The PoC Finder!!
            @By: 0xRobiul
''' $STOP
if [[ -z "$1" ]]; then
    echo -e "$Cyan s = Single CVE (CVE NUMBER) "
    echo -e "   For Example: ./cve.sh s CVE-XXXX-XXXX"
    echo -e " m = Mass CVE (Number of CVE How Much You Want)"
    echo -e "   For Example: ./cve.sh m 10 $STOP"
elif [ $1 == "s" ]; then 
    echo -e "$GREEN Searching for $2 ..."
    sleep 1
    echo " "
    curl "https://poc-in-github.motikan2010.net/api/v1/?cve_id="$2 -s | jq | grep html_url | awk -F '"' '{print $4}'
    echo -e $STOP
elif [ $1 == "m" ]; then
    echo -e "$GREEN Searching for $m CVE..."
    sleep 1
    echo " "
    curl "https://poc-in-github.motikan2010.net/api/v1/?limit="$m -s | jq | grep html_url | awk -F '"' '{print $4}'
    echo -e "$STOP"
fi 
