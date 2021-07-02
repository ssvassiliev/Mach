#!/bin/bash

# Copy ~/.vnc/passwd file from the remote to the local machine
PasswordFile=$HOME/.vnc/passwd
Node=$1
Host=mach2.ace-net.ca
#Host=cedar.computecanada.ca
#Host=graham.computecanada.ca

vncviewer_MacOS() {
/Applications/TigerVNC\ Viewer\ 1.11.0.app/Contents/MacOS/TigerVNC\ Viewer -passwd $PasswordFile localhost:$1
}

vncviewer_Linux() {
vncviewer -passwd $PasswordFile localhost:$1
}

P=$(ssh -J $Host $Node 'vncserver -localhost no -autokill -verbose >& t; grep desktop t | cut -f17 -d " "; rm t')
echo -e "\nvncserver is listening at $Node:$P"
ssh -f -o ExitOnForwardFailure=yes $Host -L $P:$Node:$P sleep 1
echo "opening SSH tunnel to $Node .."
vncviewer_Linux $P
ssh -J $Host $Node vncserver -list



