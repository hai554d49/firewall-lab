#!/bin/bash
#
#  This script will be run after parameterization has completed, e.g., 
#  use this to compile source code that has been parameterized.
#  The container user password will be passed as the first argument,
#  (the user ID is the second parameter)
#  If this script is to use sudo and the sudoers for the lab
#  does not permit nopassword, then use:
#  echo $1 | sudo -S the-command
#
#  If you issue commands herein to start services, and those services
#  have unit files prescribing their being started after the
#  waitparam.service, then first create the flag directory that
#  waitparam sleeps on:
#
#   PERMLOCKDIR=/var/labtainer/did_param
#   echo $1 | sudo -S mkdir -p "$PERMLOCKDIR"
sudo sysctl -w net.ipv4.ip_forward=1

# Xóa các rule cũ
sudo iptables -F
sudo iptables -t nat -F

# Thiết lập chính sách mặc định
sudo iptables -P FORWARD DROP
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT

# Giữ các kết nối đã được thiết lập
sudo iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

exit 0










