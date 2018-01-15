#!/bin/bash

# change this to the paths for the .sites file and the .swoosh script
alias srcsites="source ~/swoosh/.sites;"
alias src="source ~/swoosh/.swoosh.sh"

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
        echo "$newsite" >> ~/.sites
        srcsites
        return 
    else
        echo "sites[$1]=$2@$3" >> ~/.sites
        srcsites
        return
    fi
}

swoosh() {
    if [ -z "$1" ]; then
        srcsites
        echo "Sorry, babe, I need a site to swoosh. Choose one:"
        for K in "${!sites[@]}"; do
            echo -e "Write ${GREEN}${BOLD}swoosh $K ${NCN}${NCN}for ${MAGEN}${BOLD}${sites[$K]}${NCN}${NCN}";
        done
    else
        echo "Swoooooooooooooooooooooooooooooooooosh"
        ssh ${sites[$1]}
        return
    fi
}
