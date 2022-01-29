#!/bin/bash
mcl_releases="1.2.2"
mah_releases="v2.4.0"
wget https://github.com/iTXTech/mirai-console-loader/releases/download/v$mcl_releases/mcl-$mcl_releases.zip
unzip mcl-$mcl_releases.zip -d ./mcl
wget https://github.com/iTXTech/mcl-addon/releases/download/v$mcl_releases/mcl-addon-$mcl_releases.jar -P ./mcl/plugins
wget https://github.com/project-mirai/mirai-api-http/releases/download/$mah_releases/mirai-api-http-$mah_releases.mirai.jar -P ./mcl/plugins
cd ./mcl && ./mcl &
sleep 30
kill %1