cmake_minimum_required(VERSION 3.31)

project(penumbra)

# Set language standards to what presumably would have been in use at the time.
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD 98)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Force 32-bit compilation. Some dependencies (namely, the version of Newton
# used for the game) are only available in 32-bit.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")

add_subdirectory(PenumbraOverture)
