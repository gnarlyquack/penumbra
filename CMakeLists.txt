cmake_minimum_required(VERSION 3.31)

project(penumbra)

# Set language standards to what presumably would have been in use at the time.
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD 98)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Override compiler flags for Debug builds.
# Namely, we want to use -g3 instead of -g0
set(CMAKE_C_FLAGS_DEBUG "-g3")
set(CMAKE_CXX_FLAGS_DEBUG "-g3")


find_package(SDL2 REQUIRED SDL2 SDL2main)
find_package(SDL2_image REQUIRED)
find_package(SDL2_ttf REQUIRED)


add_subdirectory(external/angelscript)

add_subdirectory(PenumbraOverture)
