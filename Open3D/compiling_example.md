## [Building C++ projects with Open3D](http://www.open3d.org/docs/latest/tutorial/C++/cplusplus_interface.html) 


1. Make directories and download example code on MACH2 (MACH1 does not have internet access)
~~~
mkdir ~/TestVisualizer
cd ~/TestVisualizer

wget http://www.open3d.org/docs/latest/_downloads/9b31487dfb060f933672da66888ff9e0/TestVisualizer.cpp

wget http://www.open3d.org/docs/latest/_downloads/fec171dc63cc69d958f5cc1bb06b6c9c/CMakeLists.txt

mkdir build
~~~

2. Build the project:
~~~
ssh mach1k80
cd ~/TestVisualizer/build

cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_PREFIX_PATH="/opt/software/Open3D/Open3Droot/lib/cmake" ..
make
~~~