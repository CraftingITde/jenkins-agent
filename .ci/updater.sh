#!/bin/bash

LATEST_VERSION=$(curl -s 'https://api.github.com/repos/jenkinsci/docker-inbound-agent/releases/latest' | jq -r '.tag_name');
CURRENT_VERSION=$(sed -nr 's/FROM jenkins\/inbound-agent:*(.+)/\1/p' Container/docker/Dockerfile | tr -d '[:cntrl:]');
REPO_ADRESS=$(git config --get remote.origin.url | sed 's~http[s]*://~~g')

echo "Found versions:"
echo "  Latest:  ${LATEST_VERSION}"
echo "  Current: ${CURRENT_VERSION}"
echo "  Repo:    ${REPO_ADRESS}"


#check for null 
if [ "$LATEST_VERSION" = "null" ]; then
    echo "Latest: null!!!"
    exit -1
fi

# Set Version in all Docker Files
sed -i -e "/FROM jenkins/s/${CURRENT_VERSION}/${LATEST_VERSION}/" Container/docker/Dockerfile
sed -i -e "/FROM jenkins/s/${CURRENT_VERSION}/${LATEST_VERSION}/" Container/dotnet/Dockerfile
sed -i -e "/FROM jenkins/s/${CURRENT_VERSION}/${LATEST_VERSION}/" Container/javamaven/Dockerfile
sed -i -e "/FROM jenkins/s/${CURRENT_VERSION}/${LATEST_VERSION}/" Container/releaser/Dockerfile
sed -i -e "/FROM jenkins/s/${CURRENT_VERSION}/${LATEST_VERSION}/" Container/javascript/Dockerfile

git diff --exit-code . > /dev/null

if [ "$?" -eq "0" ]; then
	echo "No changes made. Nothig to do..."
    exit 0
else
	echo "Committing changes"
    # Add changes and Push
    git config user.name "CraftingIT-Bot"
    git config user.email "$username@craftingit.de"
    # Add All Docker Files
    git add Container/docker/Dockerfile
    git add Container/dotnet/Dockerfile
    git add Container/javamaven/Dockerfile
    git add Container/javascript/Dockerfile
    git add Container/releaser/Dockerfile
	git commit --message "Bump to latest version ${VERSION}"
    git push https://$username:$password@$REPO_ADRESS HEAD:master
fi

git fetch --tags &> /dev/null
git show "${LATEST_VERSION}" &> /dev/null
if [ "$?" -eq "0" ]; then
	echo "Tag '${LATEST_VERSION}' already exist. Skipping..."
else

	echo "Tag '${LATEST_VERSION}' not exist. Creating..."
    git tag -a ${LATEST_VERSION} -m "New Version ${LATEST_VERSION} by CraftingIT-Bot"

    git push https://$username:$password@$REPO_ADRESS --tags
fi