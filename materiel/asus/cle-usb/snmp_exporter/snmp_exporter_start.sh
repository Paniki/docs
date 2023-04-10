#!/bin/bash

pidof snmp_exporter

if [[ $? -ne 0 ]] ; then
    /mnt/ASUS/snmp_exporter/snmp_exporter --web.listen-address=":9116" >>/mnt/ASUS/snmp_exporter/snmp_exporter.log 2>&1 &
fi
