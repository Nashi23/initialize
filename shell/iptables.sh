# reset the default policies in the filter table.
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# reset the default policies in the nat table.
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT

# reset the default policies in the mangle table.
iptables -t mangle -P PREROUTING ACCEPT
iptables -t mangle -P OUTPUT ACCEPT

# flush all the rules in the filter and nat tables.
iptables -F
iptables -t nat -F
iptables -t mangle -F

# erase all chains that's not default in filter and nat table.
iptables -X
iptables -t nat -X
iptables -t mangle -X
All rules have been deleted

# Allow ssh port
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
# Allow established connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Allow local access to all ports
iptables -A INPUT -p tcp -j ACCEPT -s 127.0.0.1
