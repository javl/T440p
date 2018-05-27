#!/usr/bin/env python

import subprocess
import ConfigParser

# Import the list of networks known to wicd and build a list of networks that
# have encryption enabled
Config = ConfigParser.ConfigParser()
Config.read("/etc/wicd/wireless-settings.conf")

possible_networks = []
for network in Config.sections():
    try:  # this will fail for networks without a key
        key = Config.get(network, "key")
        essid = Config.get(network, "essid")
        possible_networks.append(essid)
    except Exception:
        pass
# remove doubles from the list
possible_networks = set(possible_networks)

# Scan for available networks and compare the result to the list of known
# networks. Then, connect to the first known one. I think the chance of having
# multiple known protected networks is small enough to ignore.
available_networks = subprocess.check_output(["/usr/bin/wicd-cli", "--wireless", "-l"])
# split on newlines and remove the last and first lines (empty line)
available_networks = available_networks.split("\n")[1:-1]
for network in available_networks:
    if network.split("\t")[3] in possible_networks:
        connect_network = subprocess.check_output(["/usr/bin/wicd-cli", "--wireless", "-c", "-n", network.split("\t")[0]])
        break  # nothing else to do
