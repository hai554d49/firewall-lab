#!/bin/bash
echo "Constantly sending login credentials to Webserver port 80..."
echo "Press Ctrl + C to dismiss."

while true; do
    echo "admin_credentials=root:AdminSuperSecr3t!" | nc -w 1 192.168.20.10 80 > /dev/null 2>&1
    sleep 5
done
