#!/bin/bash
mcl_releases="1.2.3"
mah_releases="2.5.1"
wget https://github.com/iTXTech/mirai-console-loader/releases/download/v$mcl_releases/mcl-$mcl_releases.zip
unzip mcl-$mcl_releases.zip -d ./mcl
chmod +x ./mcl/mcl
wget https://github.com/project-mirai/mirai-api-http/releases/download/v$mah_releases/mirai-api-http-$mah_releases.mirai.jar -P ./mcl/plugins
cd ./mcl && ./mcl &
sleep 120
kill %1
