WAN="eth0"  # 10.x
DMZ="eth1"  # 20.x
LAN="eth2"  # 30.x

sudo iptables -t nat -A PREROUTING -i $WAN -p tcp --dport 80 -j DNAT --to-destination 192.168.20.10:80
sudo iptables -A FORWARD -i $WAN -o $DMZ -p tcp -d 192.168.20.10 --dport 80 -j ACCEPT

sudo iptables -t nat -A PREROUTING -i $WAN -p tcp --dport 2222 -j DNAT --to-destination 192.168.20.10:22
sudo iptables -A FORWARD -i $WAN -o $DMZ -p tcp -d 192.168.20.10 --dport 22 -j ACCEPT

sudo iptables -A FORWARD -i $DMZ -o $LAN -j ACCEPT
sudo iptables -A FORWARD -i $LAN -o $DMZ -j ACCEPT
sudo iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT

