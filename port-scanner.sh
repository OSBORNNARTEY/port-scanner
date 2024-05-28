#! /bin/python3

import sys
import socket
from datetime import datetime

if len(sys.argv) == 2:
	target = socket.gethostbyname(sys.argv[1])
else:
	print("INvalid input")

print("-" * 50)
print("Scanning target: " + target)
print("Starting Time: " + str(datetime.now()))
print("-" * 50)

try:
	for port in range(0,1023):
		s = socket.socket(socket.AF_INET , socket.SOCK_STREAM)
		socket.setdefaulttimeout(1)
		result = s.connect_ex((target , port)) # Error indicator
	
		if result ==0:
			print("port " + str(port) + " is open")
		else:
			print("port " + str(port) + " is closed")
		s.close()
	
	
except KeyboardInterrupt:
	print("\n Exiting program. THanks for using Optimus port_scanner")
	sys.exit()

except socket.gaierror:
	print("Hostname could not be resolved") # any thing thats not an ip address
	sys.exit()
	
except socket.error:
	print ("Could not connet to server") # serer not online
	sys.exit()	
