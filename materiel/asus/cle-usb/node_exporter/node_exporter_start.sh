#!/bin/bash

pidof node_exporter

if [[ $? -ne 0 ]] ; then
    /mnt/ASUS/node_exporter/node_exporter --web.listen-address=":9100" >>/mnt/ASUS/node_exporter/node_exporter.log 2>&1 &
fi
