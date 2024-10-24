#!/usr/bin/env bash

# **************************************** "
#            File Name: drun.sh            "
# **************************************** "
#          Created by (c)2024 DG           "
# **************************************** "

# Function Setup
function finish { tput setaf 3; echo -e "DONE! ;-)"; tput sgr0; exit 0; }

docker run --rm -d --name containerName -p 80:8080 imageName-01-prod:v1.0

# Just a finish greetings :)
finish

