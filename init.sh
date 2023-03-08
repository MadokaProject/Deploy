#!/bin/bash
mcl_releases="2.1.2"
mah_releases="2.9.1"
wget https://github.com/iTXTech/mirai-console-loader/releases/download/v$mcl_releases/mcl-$mcl_releases.zip
unzip mcl-$mcl_releases.zip -d ./mcl
chmod +x ./mcl/mcl
wget https://github.com/project-mirai/mirai-api-http/releases/download/v$mah_releases/mirai-api-http-$mah_releases.mirai2.jar -P ./mcl/plugins
cd ./mcl && ./mcl &
sleep 150
kill %1
