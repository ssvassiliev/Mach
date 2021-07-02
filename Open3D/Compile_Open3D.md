### Installing Open3D on mach1k80/Ubuntu_20.04
#### 1. Install essential Ubuntu packages
~~~
sudo apt install python3-virtualenv vim ninja-build
~~~

#### 2. Install the latest cmake
~~~
sudo apt remove --purge cmake
hash -r
sudo snap install cmake --classic
~~~

#### 3. Install Open3D dependencies  
~~~ 
Open3D/util/install_deps_ubuntu.sh  
~~~

#### 4. Install third party dependencies
~~~
sudo apt install libxrandr-dev libxinerama-dev libxcursor-dev libc++-8-dev libc++abi-8-dev libxi-dev
~~~

#### 5. Using Ubuntu supplied libraries
- Libraries that can be used
~~~
sudo apt install liblzf-dev libpng-dev libjpeg-dev libglew-dev pybind11-dev
~~~
- Libraries that can not be used
~~~
libfmt-dev libeigen3-dev
~~~

#### 6. Install CUDA
https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_local

#### 7. Compile and install Open3D
- By default Open3D libraries are installed in /usr/local/lib/

~~~
git clone --recursive https://github.com/intel-isl/Open3D
mkdir Open3D/build
cd Open3D/build
git submodule update --init --recursive
cmake\
 -DCMAKE_INSTALL_PREFIX=$HOME/Open3D_root\
 -DBUILD_SHARED_LIBS=ON\
 -DCMAKE_C_COMPILER=gcc\
 -DCMAKE_CXX_COMPILER=g++\
 -DPYTHON_EXECUTABLE=/usr/bin/python3\
 -DBUILD_PYTHON_MODULE=ON\
 -DBUILD_CUDA_MODULE=ON\
 -DUSE_SYSTEM_LIBLZF=OFF\
 -DUSE_SYSTEM_PNG=ON\
 -DUSE_SYSTEM_JPEG=OFF\
 -DUSE_SYSTEM_EIGEN3=OFF\
 -DUSE_SYSTEM_FMT=OFF\
 -DUSE_SYSTEM_GLEW=OFF\
 -DUSE_SYSTEM_PYBIND11=OFF\
 ../
cmake --build . --config Release --parallel 4 --target install
~~~

