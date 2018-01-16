#!/bin/bash

# lemme put some color in your life
MAGEN='\033[0;35m'
NCN='\033[0m'
BOLD='\033[1m'
GREEN='\033[0;32m'

# change this to the paths for the .sites file and the .swoosh script
SITESPATH="~/swoosh/.sites"
alias srcsites="source $SITESPATH;"
srcsites

newswoosh() {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
        newsite="sites["
        
        echo "Hey love! Let's add a new ssh host to the database".
        echo -e "Please provide a ${MAGEN}sitename${NCN}."
        read sitename
        newsite="$newsite$sitename]="
        
        echo -e "Aiite, now lemme get the ${MAGEN}username${NCN} for this site."
        read username
        newsite="$newsite$username@"

        echo -e "Thanks, boo. And what's the host?"
        read hostname
        newsite="$newsite$hostname"
        echo "$newsite" >> $SITESPATH
        echo -e "All set, love. Type ${GREEN}${BOLD}swoosh $sitename ${NCN}${NCN}for ${MAGEN}${BOLD}${sites[$sitename]}${NCN}${NCN}";
        srcsites
        return 
    else
        echo "sites[$1]=$2@$3" >> $SITESPATH
        srcsites
        return
    fi
}

swoosh() {
    if [ -z "$1" ]; then
        srcsites
        echo "Sorry, babe, I need a site to swoosh."
        if [ ${#sites[@]} -eq 0 ]; then
            echo "Run newswoosh to add a site."
            return
        fi
        echo "Choose one:"
        for K in "${!sites[@]}"; do
            echo -e "Type ${GREEN}${BOLD}swoosh $K ${NCN}${NCN}for ${MAGEN}${BOLD}${sites[$K]}${NCN}${NCN}";
        done
    else
        echo "Swoooooooooooooooooooooooooooooooooosh"
        ssh ${sites[$1]}
        return
    fi
}
