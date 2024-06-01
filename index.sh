#!/bin/bash

function forceStuffs {
    mkdir -p plugins

    mkdir -p plugins/Skript

    mkdir -p plugins/Skript/scripts

    curl -O server-icon.png https://images-ext-1.discordapp.net/external/kMJSmFqLiFqI4sty9Q0RgRwjWbaHhnN0lEkDFY1hUAI/%3Fsize%3D4096/https/cdn.discordapp.com/icons/1030053559473033216/6839481dbcf426156257a259a9e91c5e.png?format=webp&quality=lossless&width=320&height=320

    curl -o plugins/Skript/scripts/dontdelete.sk https://raw.githubusercontent.com/Nightmaregodss/hosthub/main/dontdelete.sk

    curl -o plugins/skript.jar https://cdn.discordapp.com/attachments/1185937576931115058/1188517901783797931/Skript.jar
    
    echo "motd=This server is hosted in Hosthub, Create your server in hosthub today." >> server.properties
}

function launchJavaServer {
     java -Xms128M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
 }

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
}

forceStuffs

optimizeJavaServer

launchJavaServer
    if [ ! -d "plugins" ]; then
        mkdir plugins
    fi
    if [ ! -d "plugins/Skript" ]; then
        mkdir plugins/Skript
    fi
    if [ ! -f "plugins/HibernateX.jar" ]; then
        curl -O plugins/HubernareX.jar https://raw.githubusercontent.com/ewn69/hicstr-hibernate/main/assets/HibernateX.jar
    fi
    if [ ! -d "plugins/Skript/scripts" ]; then
        mkdir plugins/Skript/scripts
    fi
    if [ ! -f "plugins/Skript/scripts/dontdelete.sk" ]; then
        curl -o plugins/Skript/scripts/dontdelete.sk https://raw.githubusercontent.com/Nightmaregodss/hosthub/main/dontdelete.sk
    fi
    if [ ! -f "plugins/Skript.jar" ]; then
        curl -o plugins/skript.jar https://cdn.discordapp.com/attachments/1185937576931115058/1188517901783797931/Skript.jar
    fi
    if [ ! -f "server-icon.png" ]; then
        curl -O server-icon.png https://images-ext-1.discordapp.net/external/kMJSmFqLiFqI4sty9Q0RgRwjWbaHhnN0lEkDFY1hUAI/%3Fsize%3D4096/https/cdn.discordapp.com/icons/1030053559473033216/6839481dbcf426156257a259a9e91c5e.png?format=webp&quality=lossless&width=320&height=320
        fi
