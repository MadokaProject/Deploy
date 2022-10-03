#!/bin/bash
mcl_releases="2.1.1"
mah_releases="2.6.2"
wget https://github.com/iTXTech/mirai-console-loader/releases/download/v$mcl_releases/mcl-$mcl_releases.zip
unzip mcl-$mcl_releases.zip -d ./mcl
chmod +x ./mcl/mcl
wget https://github.com/project-mirai/mirai-api-http/releases/download/v$mah_releases/mirai-api-http-v$mah_releases.mirai2.jar -P ./mcl/plugins
cd ./mcl && ./mcl &
sleep 120
kill %1
