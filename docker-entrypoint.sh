#!/bin/bash

$neighbors
for buddy in $(cat /iri/conf/neighbors); do
  neighbors="$buddy $neighbors"
done
neighbors=${neighbors::-1}

exec java -XX:+DisableAttachMechanism -Xmx8g -Xms256m -Dlogback.configurationFile=/iri/logback.xml -Djava.net.preferIPv4Stack=true -jar /iri/target/iri-1.3.2.2.jar -p 14265 -u 14777 -t 15777 -n "$neighbors" --remote --remote-limit-api "addNeighbors, removeNeighbors" --send-limit 100.0 "$@"

