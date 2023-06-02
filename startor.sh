#!/bin/bash
#
if [[ "$1" == "-reload" ]]
	then
		sudo service tor force-reload && service privoxy force-reload
fi
#
sudo service tor start && echo "Tor is being started."
sleep 1
echo "Tor has been started and is listening on port: " 
netstat -anpe | grep `pidof tor` | grep "LISTEN" | cut -d":" -f2 | cut -d" " -f1 | grep [0-9]
sudo service privoxy start && echo "Starting privoxy"
sleep 1
echo "Privoxy is on and listening on port: "  
netstat -anpe | grep `pidof privoxy` | grep "LISTEN" | cut -d":" -f2 | cut -d" " -f1 | grep [0-9]
echo "If you wanr to reload both, run script with parameter \"reload\", np ./torstart -reload" 
