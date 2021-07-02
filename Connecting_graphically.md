## Connecting graphically to mach1k80

### Using the script *startvnc_ubuntu.sh*
1. Install tigervnc viewer on your local computer
~~~
sudo apt-get install -y tigervnc-viewer
~~~

2. Download *startvnc_ubuntu.sh* from this repository 

3. Connect graphically
~~~
sh startvnc_ubuntu.sh mach1k80
~~~

4. Please logout on the windows manager. If you just close the windows vncserver session in your account will remain running. 


#### Starting vnc server
On Ubuntu, vncserver by default is listening on localhost, so we need two tunnels:

~~~
ssh -L 9550:mach1k80:22 mach2.ace-net.ca
ssh -L 5902:localhost:5902 localhost -p 9550
~~~

Alternatively, tell vncserver to listen on network:

~~~
vncserver -localhost no
~~~

