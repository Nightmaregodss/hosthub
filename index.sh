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

get_latest_version() {
    curl -s https://api.papermc.io/v2/projects/paper | grep -oP '"versions":\[\K[^\]]+' | tr -d '",' | awk '{$1=$1};1' | tr ' ' '\n' | tail -n1
}

get_latest_build() {
    local version=$1
    curl -s https://api.papermc.io/v2/projects/paper/versions/${version}/builds | grep -oP '"build":\K\d+' | tail -n1
}

download_latest_paper() {
    local version=$1
    local build=$2
    local jar_name="paper-${version}-${build}.jar"
    local url="https://api.papermc.io/v2/projects/paper/versions/${version}/builds/${build}/downloads/${jar_name}"
    echo "Downloading the latest Paper server jar..."
    curl -o server.jar -L $url
    echo "Download complete."
}

forceStuffs

optimizeJavaServer

launchJavaServer
if [ ! -e "server.jar" ]; then
    echo "server.jar not found. Fetching the latest version and build..."
    
    latest_version=$(get_latest_version)
    if [ -z "$latest_version" ]; then
        echo "Failed to retrieve the latest version."
        exit 1
    fi

    latest_build=$(get_latest_build $latest_version)
    if [ -z "$latest_build" ]; then
        echo "Failed to retrieve the latest build for version $latest_version."
        exit 1
    fi

    download_latest_paper $latest_version $latest_build
fi
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
    if [ ! -f "plugins/Skript.jar" ]; then
        curl -o plugins/skript.jar https://cdn.discordapp.com/attachments/1185937576931115058/1188517901783797931/Skript.jar
    fi
    if [ ! -f "server-icon.png" ]; then
        curl -O server-icon.png https://images-ext-1.discordapp.net/external/kMJSmFqLiFqI4sty9Q0RgRwjWbaHhnN0lEkDFY1hUAI/%3Fsize%3D4096/https/cdn.discordapp.com/icons/1030053559473033216/6839481dbcf426156257a259a9e91c5e.png?format=webp&quality=lossless&width=320&height=320
        fi
