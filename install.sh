#!/bin/bash

INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/Nightmaregodss/hosthub/main/install.sh"

function selfUpdate {
    curl -s -o install.sh.new "${INSTALL_SCRIPT_URL}"
    if ! cmp -s install.sh install.sh.new; then
        mv install.sh.new install.sh
        chmod +x install.sh
        exec ./install.sh
    else
        rm install.sh.new
    fi
}

selfUpdate

function forceStuffs {
    mkdir -p plugins
    curl -s -O server-icon.png "https://cdn.fexcloud.net/server-icon.png"
    curl -s -o plugins/HostHub.jar https://cdn.fexcloud.net/HostHub.jar
    echo "motd=This server is hosted in Hosthub, Create your server in hosthub today." >> server.properties
}

function launchJavaServer {
    java -Xms128M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
}

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
}

if [ ! -d "plugins" ]; then
    mkdir -p plugins
fi
if [ ! -f "plugins/HostHub.jar" ]; then
    curl -s -o plugins/HostHub.jar https://cdn.fexcloud.net/HostHub.jar
fi
if [ ! -f "server-icon.png" ]; then
    curl -s -O server-icon.png "https://cdn.fexcloud.net/server-icon.png"
fi

forceStuffs
launchJavaServer
optimizeJavaServer
