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

# Force 32-bit compilation. Some dependencies (namely, the version of Newton
# used for the game) are only available in 32-bit.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")


# Specify the root path(s) to search for 32-bit libraries so calls to 'find_*'
# commands will discover the correct library versions. Since this seems to vary
# widely across platforms, it seems best to make this user-configurable.
set(LIB32_PATH /usr/lib32 CACHE PATH "Search path(s) for 32-bit libraries")

# Use the cache variable to override CMake's default library search behavior.
set(CMAKE_LIBRARY_PATH ${LIB32_PATH})


add_subdirectory(external/angelscript)

add_subdirectory(PenumbraOverture)
