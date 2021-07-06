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

## Compiling Open3D examples

~~~
cp -r /opt/software/Open3D/Open3D/examples/ ~
cd ~/examples
rm cpp/CMakeLists.txt

cat <<EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.12.0)
set (CMAKE_CXX_STANDARD 14)

project(Examples LANGUAGES C CXX)

# Find installed Open3D, which exports Open3D::Open3D
find_package(Open3D HINTS ${CMAKE_INSTALL_PREFIX}/lib/cmake)
if(NOT Open3D_FOUND)
    message(FATAL_ERROR "Open3D not found, please use -DCMAKE_INSTALL_PREFIX=open3d_install_dir")
endif()

add_executable(Image ../cpp/Image.cpp)
target_link_libraries(Image Open3D::Open3D)

add_executable(Draw ../cpp/Draw.cpp)
target_link_libraries(Draw Open3D::Open3D)
EOF

mkdir build
cd build
cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_PREFIX_PATH="/opt/software/Open3D/Open3Droot/lib/cmake" ..
~~~


