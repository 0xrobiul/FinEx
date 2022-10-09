#!/bin/bash
echo '''
    _______       ______   
   / ____(_)___  / ____/  __
  / /_  / / __ \/ __/ | |/_/
 / __/ / / / / / /____>  <  
/_/   /_/_/ /_/_____/_/|_|  

The PoC Finder!!
'''

if [[ -z "$1" ]]; then
  echo '''Error: Please Provide A CVE ID!
Example: CVE-XXXX-XXXX
       '''
elif [[ -n "$1" ]]; then
  curl "https://poc-in-github.motikan2010.net/api/v1/?cve_id="$1 -s | jq | grep html_url | awk -F '"' '{print $4}'
fi
