# IP address
# subnet mask: network portion/host portion
#
# gateway
# Gateway is the entry point of the subnet; at least 1 gateway per subnet
# Each gateway must be assigned an ip address in the subnet
#
# OSI model
# 5. Application layer: Message - HTTP, DHCP, SSH
# 4. Transport layer: TCP segment - Port
# 3. Internet layer: Packet - IP
# 2. Data Link layer: Frame - MAC
# 1. Physical layer: Bits - NIC, PHY
#
# OSI layer 2: At the Data Link layer, data is encapsulated into frames that include both the source and destination Media Access Control (MAC) addresses. The Data Link layer devices, such as switches and bridges, use this information to forward the frames between different devices on the same network segment. They also perform functions such as error detection and correction, flow control, and access control.
#
# packet vs. frame
# A packet is a unit of data that is used for communication between devices on different networks. It consists of a header and a payload, where the header includes information such as the source and destination IP addresses, the protocol being used, and other routing information. The payload contains the actual data being transmitted.
# On the other hand, a frame is a unit of data that is used for communication between devices on the same network segment. It consists of a header and a payload, where the header includes information such as the source and destination MAC addresses, as well as other control information such as frame type, length, and error detection. The payload contains the actual data being transmitted.
# The main difference between packets and frames is the layer of the OSI model at which they operate. Packets are used at the Network layer (Layer 3) to route data between different networks, while frames are used at the Data Link layer (Layer 2) to transmit data between devices on the same network segment.
#
# subnet
# Each network interface has an ip and a subnet. Having both an IP address and a subnet mask allows the network devices to determine whether they can communicate directly with each other or if they need to forward packets to a different network.

########################################################################################
traceroute -I 8.8.8.8
########################################################################################
# ip
#
ip link add dev wg0 type wireguard

ip link set up dev wg0  # activate the network interface
########################################################################################
# net-filter framework firewall
# Tables, chains and rules are 3 fundamental concepts in the netfilter firewall framework used in Linux operating systems.
#
# table refers to a container of chains with no specific semantics.
# chain within a table refers to a container of rules.
# rule refers to an action to be configured within a chain.
#
# Table:
#   Chain:
#     Rule
# 
########################################################################################
# iptables
# Table
# used to organize and categorize firewall rules based on their purpose or function. There are four predefined tables in netfilter:
# 
#     Filter table: Used for packet filtering, which involves dropping, accepting, or rejecting packets based on various criteria such as source and destination IP address, protocol, port, and so on.
#     NAT table: Used for network address translation (NAT), which involves modifying the source or destination IP address and/or port of packets as they traverse the firewall.
#     Mangle table: Used for more advanced packet manipulation, such as altering packet headers, setting specific flags, or changing the packet's ToS (Type of Service) field.
#     Raw table: Used for handling packets before they are filtered by the other tables. It is typically used for marking packets to be exempt from filtering, or for setting connection tracking states.
# 
# Chain
# Each table can contain multiple chains(think of it as points in the route where packet gets processed.), which are used to process packets in a specific order based on their target. There are three types of chains in netfilter:
#     Pre-routing change: Apply to any incoming packet before any routing decisions
#     Input chain: Processes packets destined for the local system.
#     Forward chain: Processes packets that are being forwarded to another system.
#     Output chain: Processes packets generated by the local system and are going out.
#     Post-routing: Processes packets after routing decision & packet going on wire
#
# Rule: Commands that user defined to manipulate network traffic
# As each chain is called, the packet will be checked against each rule in the chain in order. If the packet does not match, the next rule in the chain is examined; If matched, then the next rule is specified by the value of target.
# Each rule has bascially 2 components: matching component & target component
# e.g.: iptables -A INPUT -s 15.15.15.51 -j DROP
# marching component [-s 15.15.15.51]: different conditions available to define rules:
#   1. Protocol
#   2. IP Address
#   3. Port Address
#   4. Interfaces
#   5. Headers
#   6. ...
# target component [-j DROP]: Actions that are triggered when a packet meets the matching criteria of the rule. Basically 2 types of targets:
# Terminating Targets:
#   Accept, Drop, Queue, Reject, Return, User-Defined
# Non-Terminating Targets
#   Continue the chain

########################################################################################
# nftables
# reference: https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes
########################################
# 1. Create a table
nft add table inet table_name 
# # add: Action element: add, list, delete create
# # inet: Family type: ip, ip6, inet, arp, bridge, netdev
% nft list tables [<family>]
% nft list table [<family>] <name> [-n] [-a]
% nft (add | delete | flush) table [<family>] <name>
########################################
# 2. Create a chain
# Two types of chain: base chain & regular
nft add chain inet table_name chain_name {
  type filter hook input priority 0; policy accept;
}
#   # 3 chain type: filter, nat, route
#   # hook type for IPv4/IPv6/Inet: prerouting, input, forward, output, postrouting
#   # hook type for ARP: input, output
#   # priority: the priority in the traverse order; ascending order: lower value has higher priority
#   # policy (similar to action part of iptables): drop, reject(drop with feedback message), accept
# Regular Chain
% nft (add | create) chain [<family>] <table> <name> [ { type <type> hook <hook> [device <device>] priority <priority> \; [policy <policy> \;] } ]
% nft (delete | list | flush) chain [<family>] <table> <name>
% nft rename chain [<family>] <table> <name> <newname>
########################################
# 3. Create a rule
nft add rule table_name chain_name ip addr 8.8.8.8 counter    # counting number of packets with destination address of 8.8.8.8
% nft add rule [<family>] <table> <chain> <matches> <statements>
% nft insert rule [<family>] <table> <chain> [position <position>] <matches> <statements>
% nft replace rule [<family>] <table> <chain> [handle <handle>] <matches> <statements>
% nft delete rule [<family>] <table> <chain> [handle <handle>]
# handle is an internal number that identifies a certain rule.
# position is an internal number that is used to insert a rule before a certain handle. 
########################################
# Matches
# matches are clues used to access to certain packet information and create filters according to them. 
########################################
# dport: This is a shorthand for "destination port" and is used to match packets based on their destination port number. For example, the rule tcp dport 22 accept would accept all incoming TCP traffic with a destination port of 22 (which is the standard SSH port).

# daddr: This is a shorthand for "destination address" and is used to match packets based on their destination IP address. For example, the rule ip daddr 10.0.0.1 drop would drop all incoming packets with a destination IP address of 10.0.0.1.

# dnat: This is a shorthand for "destination NAT" and is used to modify the destination IP address and/or port number of packets. For example, the rule tcp dport 80 dnat 192.168.1.1:8080 would forward all incoming TCP traffic with a destination port of 80 to the IP address 192.168.1.1 on port 8080.

# Note that dport and daddr are used for packet filtering (i.e., deciding whether to accept, drop, or modify packets), while dnat is used for packet manipulation (i.e., modifying the destination IP address and/or port number of packets).
########################################
# chains give us where the filtering needs to be done, and rules state what needs to be filtered


sudo nft list tables
sudo nft list chains
sudo nft list ruleset
# delete chain
sudo nft delete chain inet wg_table wg_chain
# delete rule using handle
sudo nft -a list table inet wg_table
sudo nft delete rule inet wg_table wg_chain handle 6


sudo nft add table inet wg_table
sudo nft add chain inet wg_table wg_chain \{ type filter hook input priority 0\; policy accept\; \}
sudo nft add rule inet wg_table wg_chain icmp type echo-request reject  # icmp: protocol; reject: action

sudo nft -f file_name.nft
################################################################
# #!/usr/bin/nft -f
# 
# table inet wg_table {
#     chain wg_chain_output {
#         type filter hook output priority 0; policy accept;
#         ip daddr 13.127.19.131 reject;  # ip to block
#     }
# }
################################################################

# make the rules persistent
sudo cp /etc/nftables.conf /etc/nftables.backup
sudo nft list ruleset > /etc/nftables.conf
sudo  nft list ruleset | sudo tee /etc/nftables.conf
sudo systemctl enable nftables
sudo systemctl list-unit-files | grep nftables  # check if nftables is enabled
########################################################################################
# forwarding
# ┌──────────────────────┐                                     ┌──────────────────────┐
# │                      │                                     │                      │
# │ Incoming packet      │                                     │ Outgoing packet      │
# │ source IP + port     │                                     │ source IP + port     │
# │ destination IP + port│                                     │ destination IP + port│
# │                      │                                     │                      │
# └─────────┬────────────┘                                     └─────────▲────────────┘
#           │                                                            │
# ┌─────────┼────────────────────────────────────────────────────────────┼────────────┐
# │         │                                                            │            │
# │  ┌──────▼─────┐      ┌─┬───────┬─┐        ┌────────────┐      ┌──────┴──────┐     │
# │  │            │      │ ├───────┤ │        │            │      │             │     │
# │  │ PREROUTING ├──────►─┤ROUTING│ ├────────► FORWARD    ├──────► POSTROUTING │     │
# │  │    DNAT    │      │ ├───────┤ │        │            │      │    SNAT     │     │
# │  │            │      └─┴───┼───┴─┘        │            │      │             │     │
# │  └────────────┘            │              └────────────┘      └──────▲──────┘     │
# │                            │                                         │            │
# │                      ┌─────▼───────┐                          ┌──────┴──────┐     │
# │                      │             │                          │             │     │
# │                      │  INPUT      │                          │ OUTPUT      │     │
# │                      │  filter     │                          │ filter      │     │
# │                      │             │                          │             │     │
# │                      └─────┬───────┘                          └──────▲──────┘     │
# │                            │                                         │            │
# └────────────────────────────┼─────────────────────────────────────────┼────────────┘
#                              │                                         │
#                              │            ┌─────────────────┐          │
#                              │            │                 │          │
#                              └────────────► Application     ├──────────┘
#                                           │                 │
#                                           │                 │
#                                           └─────────────────┘
# enable IP forwarding, used by `net`
sudo sysctl net.ipv4.ip_forward # check if it's enabled
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf # To enable IP forwarding persistently

sudo nft flush ruleset  # clean rules, effectively resetting `nftables`

sudo nft add table nat
sudo nft 'add chain nat postrouting { type nat hook postrouting priority 100 ; }'
sudo nft 'add chain nat prerouting { type nat hook prerouting priority -100; }'
sudo nft 'add rule nat prerouting ip daddr 10.1.1.1 tcp dport { 8888 } dnat 10.2.2.2:9999'
sudo nft add rule nat postrouting masquerade    # used to rewrite the source IP address of outgoing packets with the IP address of the device's network interface
sudo nft list ruleset
########################################################################################
# wireguard                                                                              
# Each network interface has a private key and a list of peers.
# Each peer has a public key.
# Cryptokey Routing Table: the simple association of public keys and allowed IPs. When sending packets, the list of allowed IPs behaves as a sort of routing table, and when receiving packets, the list of allowed IPs behaves as a sort of access control list.

# install wireguard on both server and client
# sudo pacman -S wireguard-tools
# use key pair to connect between server and client
# route specific traffic using allowed IPs ( set transmission traffic to the ip)

ip link add dev wg0 type wireguard
ip address add dev wg0 192.168.2.1/24
wg setconf wg0 myconfig.conf    # or
wg set wg0 listen-port 51820 private-key /path/to/private-key peer ABCDEF... allowed-ips 192.168.88.0/24 endpoint 209.202.254.14:8172
ip link set up dev wg

# wg-quick
sudo vim /etc/wireguard/wg0.conf
sudo wg-quick up wg0
sudo wg-quick down wg0
sudo wg show
sudo wg showconf
########################################################################################