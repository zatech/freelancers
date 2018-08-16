#!/usr/bin/env sh

# Get new users details
read -p 'Name & Surname: ' name
read -p '/people/ filename: ' filename
read -p 'Website: ' website
read -p 'Skill set: ' skillset
read -p 'Github Handle: ' github

# Add new user to the README before sorting
echo "[${name}](/people/${filename}) | ${website} | ${skillset} | [GitHub](https://github.com/${github})" >> README.md

# Get the line number for the top of the table, and skip them
LNR=$(grep -n 'Name |' README.md | cut -f1 -d:)
LNR=$(($LNR+2))

# Sort the table lexographically by name
SORTED_TABLE=$(tail -n +"${LNR}" README.md | sort --field-separator=\| --key=1)

# Make a backup of the README before deleting the table and adding the sorted table
sed -i.backup ${LNR}',$d' README.md
printf "%s" "${SORTED_TABLE}" >> README.md
