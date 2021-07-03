#!/bin/bash
# Copy ~/.vnc/passwd file from the remote to the local machine
printf "\nUsage: ./startvnc_ubuntu.sh mach1k80\n"
PasswordFile=$HOME/.vnc/passwd
Node=$1
Host=mach2.ace-net.ca
geom=1280x800
OS=`uname`

vncclient() {
if [ "$OS" = "Darwin" ]
then
/Applications/TigerVNC\ Viewer\ 1.11.0.app/Contents/MacOS/TigerVNC\ Viewer -passwd $PasswordFile localhost:$1 -geometry $geom
elif [ "$OS" = "Linux" ]
then
vncviewer -passwd $PasswordFile localhost:$1 -geometry $geom
else
echo Unsupported OS: $OS
fi
}

P=$(ssh -J $Host $Node vncserver -geometry $geom -localhost no -autokill -verbose >& t; grep desktop t | cut -f17 -d " "; rm t)
echo -e "\nvncserver is listening at $Node:$P"
ssh -f -o ExitOnForwardFailure=yes $Host -L $P:$Node:$P sleep 1
echo "opening SSH tunnel to $Node .."
vncclient $P
ssh -J $Host $Node vncserver -list



