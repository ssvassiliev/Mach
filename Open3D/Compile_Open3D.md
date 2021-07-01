### Cmake can not find C/C++ compilers on mach1k80?
CMake Error: CMAKE_C_COMPILER not set, after EnableLanguage
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage

apt list --installed build-essential

### Building:
cmake\
 -DCMAKE_C_COMPILER=gcc\
 -DCMAKE_CXX_COMPILER=g++\ 
 -DPYTHON_EXECUTABLE=/usr/bin/python3\
 -DBUILD_PYTHON_MODULE=OFF\
 -DBUILD_CUDA_MODULE=ON\ 
  ../

### Installing Open3D dependencies

#### Essential dependencies
~~~
nvidia-cuda-toolkit
python3-virtualenv
vim
~~~

#### Open3D dependencies
~~~
libxrandr-dev 
libxinerama-dev
libxcursor-dev
~~~

Open3D-0.13.0/util/install_deps_ubuntu.sh  

~~~
#!/usr/bin/env bash
# Install Open3D build dependencies from Ubuntu repositories
# CUDA (v10.1) and CUDNN (v7.6.5) are optional dependencies and are not
# installed here
# Use: install_deps_ubuntu.sh [ assume-yes ]

set -ev

SUDO=${SUDO:=sudo} # SUDO=command in docker (running as root, sudo not available)
if [ "$1" == "assume-yes" ]; then
    APT_CONFIRM="--assume-yes"
else
    APT_CONFIRM=""
fi

dependencies=(
    # Open3D deps
    xorg-dev
    libglu1-mesa-dev
    python3-dev
    # Filament build-from-source deps
    libsdl2-dev
    libc++-7-dev
    libc++abi-7-dev
    ninja-build
    libxi-dev
    # ML deps
    libtbb-dev
    # Headless rendering deps
    libosmesa6-dev
    # RealSense deps
    libudev-dev
    autoconf
    libtool
)

$SUDO apt-get update
for package in "${dependencies[@]}"; do
    $SUDO apt-get install "$APT_CONFIRM" "$package"
done
~~~





