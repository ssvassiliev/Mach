## Connecting graphically to mach1k80
### Connecting automatically
#### Set up connection
1. Install tigervnc viewer on your local computer
~~~
sudo apt-get install -y tigervnc-viewer
~~~
2. Download *startvnc_ubuntu.sh* 
~~~
wget https://github.com/ssvassiliev/Mach/raw/main/Remote_Desktop_Access/startvnc_ubuntu.sh
chmod +x startvnc_ubuntu.sh
~~~
3. Generate ssh key and copy it to the remote computer
~~~
ssh-keygen
ssh-copy-id ~/.ssh/id_rsa.pub mach2.ace-net.ca
~~~
4. Generate vnc password. On the remote run *vncserver* and enter password when prompted. Then terminate vnc server: 
~~~
vncserver -kill :1
~~~
5. Copy vnc password to the local computer:
~~~
scp mach2.ace-net.ca:.vnc/passwd ~/.vnc
~~~

#### Connecting
~~~
./startvnc_ubuntu.sh mach1k80
~~~

- Please always logout of the windows manager. If you just close the window vncserver will not clean up its session. 

### Connecting manually
1. Start vnc server on mach1k80
~~~
vncserver -localhost no
~~~
2. Open ssh tunnel from your local computer
~~~
ssh mach2.ace-net.ca -L 5901:machk80:5901
~~~
3. Connect vncviewer to localhost:5901
In the commands above replace 5901 with 5900 + [vnc display number]

- Note: 
On Ubuntu vncserver by default is listening only on localhost. If you do not use the *-localhost no* option, you will need two tunnels:
~~~
ssh -L 9550:mach1k80:22 mach2.ace-net.ca
ssh -L 5902:localhost:5902 localhost -p 9550
~~~



