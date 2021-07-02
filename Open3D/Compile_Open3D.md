### Installing Open3D

#### Install essential Ubuntu packages
~~~
sudo apt install python3-virtualenv vim ninja-build
~~~

#### Install the latest cmake
~~~
sudo apt remove --purge cmake
hash -r
sudo snap install cmake --classic
~~~

#### Install Open3D dependencies  
~~~ 
Open3D/util/install_deps_ubuntu.sh  
~~~

#### Install third party dependencies
~~~
sudo apt install libxrandr-dev libxinerama-dev libxcursor-dev libc++-8-dev libc++abi-8-dev libxi-dev
~~~

Open3D can use the following system libraries:
~~~
sudo apt install liblzf-dev libpng-dev libjpeg-dev libeigen3-dev libfmt-dev libglew-dev pybind11-dev
~~~

#### Install CUDA
https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_local

#### Compile and install Open3D
- By default Open3D libraries are installed in /usr/local/lib/

~~~
git clone --recursive https://github.com/intel-isl/Open3D
git submodule update --init --recursive
cmake\
 -DCMAKE_INSTALL_PREFIX=/home/svassili/Open3D/lib\
 -DBUILD_SHARED_LIBS=ON\
 -DCMAKE_C_COMPILER=gcc\
 -DCMAKE_CXX_COMPILER=g++\
 -DPYTHON_EXECUTABLE=/usr/bin/python3\
 -DBUILD_PYTHON_MODULE=ON\
 -DBUILD_CUDA_MODULE=ON\
 -DUSE_SYSTEM_LIBLZF=ON\
 -DUSE_SYSTEM_PNG=ON\
 -DUSE_SYSTEM_JPEG=ON\
 -DUSE_SYSTEM_EIGEN3=ON\
 -DUSE_SYSTEM_FMT=OFF\
 -DUSE_SYSTEM_GLEW=ON\
 -DUSE_SYSTEM_PYBIND11=ON\
 ../
cmake --build . --config Release --parallel 4 --target install
~~~
#### Notes
- CUDA module can not be compiled with Ubuntu supplied *libfmt-dev*