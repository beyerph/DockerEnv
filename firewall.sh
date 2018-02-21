#!/bin/sh

# ---- Folgende Befehler sind notwendig, damit die Firewall mit Docker funktioniert ----
# apt-get install iptables-persistent
# service netfilter-persistent start
# sed -i s/DEFAULT_FORWARD_POLICY=\"DROP\"/DEFAULT_FORWARD_POLICY=\"ACCEPT\"/ /etc/default/ufw
# echo "{\"iptables\": false}" > /etc/docker/daemon.json
# sed -i '/*filter/i *nat\n:POSTROUTING ACCEPT [0:0]\n-A POSTROUTING ! -o docker0 -s 172.17.0.0/16 -j MASQUERADE\nCOMMIT\n\n' /etc/ufw/before.rules
# systemctl restart docker


ufw reset
ufw disable

# DEFAULT REGELN
ufw default allow outgoing
ufw default deny incoming

# FREIGEGEBENE PORTS
ufw allow 2375/tcp  # DOCKER
ufw allow 22/tcp    # SSH
ufw allow 80/tcp    # Webserver
ufw allow 443/tcp   # Webserver

iptables -t nat -A POSTROUTING ! -o docker0 -s 172.21.0.0/16 -j MASQUERADE


iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6

ufw enable
ufw reload

#http://dev-notes.eu/2016/08/persistent-iptables-rules-in-ubuntu-16-04-xenial-xerus/
invoke-rc.d netfilter-persistent save