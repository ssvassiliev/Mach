Paraview is compiled using the following command:

~~~
CC=gcc CXX=g++ LD=g++ cmake -GNinja\
 -DPARAVIEW_USE_PYTHON=ON\
 -DPARAVIEW_USE_MPI=OFF\
 -DVTK_SMP_IMPLEMENTATION_TYPE=TBB\
 -DCMAKE_BUILD_TYPE=Release\
 ../ParaView-v5.9.1

ninja
~~~