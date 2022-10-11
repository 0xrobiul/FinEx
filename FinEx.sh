#!/bin/bash

GREEN="\e[1;97;92m"
Gcyan="\e[1;97;93m"
Cyan="\e[1;97;96m"
STOP="\e[0m"
echo -e ${Gcyan}'''
    _______       ______
   / ____(_)___  / ____/  __
  / /_  / / __ \/ __/ | |/_/
 / __/ / / / / / /____>  <
/_/   /_/_/ /_/_____/_/|_|
'''
echo -e ${Cyan}'''The PoC Finder!!'''
echo -e ${Gcyan}'''            @By: 0xRobiul

''' ${STOP}
while getopts s:l: flag
do
        case "${flag}" in
                s) search=${OPTARG}
                  export ID=${OPTARG}
                         ;;
                l) limit=${OPTARG}
                  export LIMIT=${OPTARG}
                         ;;
                ?) echo '''Invalid option, Try As "./FinEx.sh -s CVE-2021-41349 -l 1" [Default 10]'''
          		   exit 1
			 ;;
        esac
done
if [[ -z "$ID" ]]; then
  echo '''CVE Number Not Provided, Try As "./FinEx.sh -s CVE-2021-41349 -l 1 [Default 10]'''
  exit 1
elif [[ -n "$ID" ]]; then
  echo -e "${GREEN}Searching for $ID ...${Cyan}"
    sleep 1
    echo " "
    curl "https://poc-in-github.motikan2010.net/api/v1/?cve_id=$ID&limit=$LIMIT" -s | jq | grep html_url | awk -F '"' '{print $4}'
    echo -e "${STOP}"
fi
