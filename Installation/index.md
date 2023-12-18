# FHI-aims Tutorials
---

Prerequisites: A working computer (linux or mac OS) with at least 4 cores installed with FHI-aims, Python3
Resources for plotting: Clims, GIMS, Python3

# INSTALLATION STEPS
1. Install Intel oneAPI toolkit *(HPC should be sufficient)* from [here](https://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html)
2. Install gcc using "sudo apt install gcc"
  - *Check if it already exists using "gcc -version"
3. Install g++ using "sudo apt install g++"
  - *Check if it already exists using "g++ -version"
4. Install cmake:
  - Download source file of cmake from [here](https://cmake.org/download/)
  - Unzip the folder and in the unzipped folder type in terminal "./configure --prefix=/opt/cmake"
    - If the above command fails, use "sudo apt-get install build-essential" and retry the above
  - Type "make"
  - Type "sudo make install"
  - *Check if it already exists using "/opt/cmake/bin/cmake -version"
5. Initiate Intel oneAPI compilers using "source /opt/intel/oneapi/setvars.sh"
6. Installing FHI-aims
  - Unzip the folder using "tar -xzvf fhi-aims.210716_2.tgz"
  - Enter the unzipped folder and make a build folder using "mkdir build"
  - Copy intial make file into build folder "cp initial_cache.example.cmake /build/"

***
Et voila! Aims calculations can now be run using the command: mpirun -n N aims.x | tee aims.out


