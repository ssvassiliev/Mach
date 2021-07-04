#!/bin/bash

# This script will start TigeVNC server session on a remote "Node" 
# accessible from a "Host" and connect TigerVNC viewer to it. 

# <<< ! Before connection ! >>> 
# copy the file ~/.vnc/passwd from the remote to the local machine.

Node = $1
Host = mach2.ace-net.ca
PasswordFile = $HOME/.vnc/passwd
geom = 1280x800
OS = `uname`

if [ "$#" -ne 1 ]
then
  printf "\nWrong number of arguments!"
  printf "\nUsage: ./startvnc_ubuntu.sh mach1k80\n\n"
  exit 1
fi

vncclient() {
  if [ "$OS" = "Darwin" ]
  then
    /Applications/TigerVNC\ Viewer\ 1.11.0.app/Contents/MacOS/TigerVNC\ Viewer -passwd $PasswordFile localhost:$1 -geometry $geom
  elif [ "$OS" = "Linux" ]
  then
    vncviewer -passwd $PasswordFile localhost:$1 -geometry $geom
  else
    echo Unsupported OS: $OS
    echo Supported systems: Darwin, Linux
  fi
}

P=$(ssh -J $Host $Node vncserver -geometry $geom -localhost no -autokill -verbose >& t; grep desktop t | cut -f17 -d " "; rm t)
echo -e "\nvncserver is listening at $Node:$P"
ssh -f -o ExitOnForwardFailure=yes $Host -L $P:$Node:$P sleep 1
echo "opening SSH tunnel to $Node .."
vncclient $P
ssh -J $Host $Node vncserver -list



