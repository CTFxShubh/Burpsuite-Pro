#!/bin/bash

   # Remove old files
   echo 'Removing Old Files...'
   sudo rm -rf /bin/burpsuitepro
   rm burpsuitepro
   sleep 1s &
   
   # Download Burpsuitepro
   echo 'Downloading Burpsuite Professional'
   html=$(curl -s https://portswigger.net/burp/releases)
   version=$(echo $html | grep -Po '(?<=/burp/releases/professional-community-)[0-9]+\-[0-9]+\-[0-9]+' | head -n 1)
   Link="https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar&version=&"
   echo $version
   wget "$Link" -O burpsuite_pro_v$version.jar --quiet --show-progress

   sleep 1s &
   # Execute Burp Suite Professional
    echo 'Executing Burpsuite Professional'
    echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuitepro
    chmod +x burpsuitepro
    sudo cp -r burpsuitepro /bin/burpsuitepro
    sudo chmod +x /bin/burpsuitepro
    (./burpsuitepro)
