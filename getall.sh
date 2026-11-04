#!/bin/bash
tok=$(cat ~/token.gh)

jq '.artifacts[].id' gh-artifacts.json > liste-id.txt

for id in $(cat liste-id.txt);
do
	echo "telechargement de l'artifact $id"
	curl -L \
	  -H "Accept: application/vnd.github+json" \
	  -H "Authorization: Bearer $tok" \
	  -H "X-GitHub-Api-Version: 2022-11-28" \
	  --output artifact-$id.zip \
	  https://api.github.com/repos/Littleroot76/tp-graphes/actions/artifacts/$id/zip
	unzip -o artifact-$id.zip -d $id
done