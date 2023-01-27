#!bin/bash/
mkdir npm-project
cd npm-project
downloadUrl=$(curl -u droplet-user:droplet-user -X GET "http://<droplet-IP>:8081/service/rest/v1/components?repository={npm-repo-jonas}&sort=version" | jq '.items[0].assets[0].downloadUrl' --raw-output)
wget --http-user=droplet-user --http-password=droplet-user $downloadUrl
tar -zxf *.tgz
cd package
npm install
node server.js
