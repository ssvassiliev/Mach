## Connecting graphically to mach1k80

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

