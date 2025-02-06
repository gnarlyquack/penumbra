add_subdirectory(../OALWrapper ../OALWrapper)
add_subdirectory(../HPL1Engine ../HPL1Engine)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/../dependencies/include
    ${CMAKE_CURRENT_SOURCE_DIR}/../HPL1Engine/include
    ${CMAKE_CURRENT_SOURCE_DIR}/../OALWrapper/include
)

link_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/../dependencies/lib/linux)

set(CMAKE_EXECUTABLE_SUFFIX .bin)

file(GLOB all_sources ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

add_executable(Overture ${all_sources})

set_target_properties(Overture PROPERTIES
    INSTALL_RPATH_USE_LINK_PATH false
    OUTPUT_NAME overture)

target_link_libraries(Overture
    PRIVATE
        # TODO We should really only be linking to the engine (and OALWrapper?)
        HPL Newton GL GLU Cg CgGL
        OALWrapper ogg vorbis vorbisfile openal
)


# Convenience target to run the game. This requires all game assets to be in
# the specified working directory
add_custom_target(run_overture
    Overture
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/redist)

# Convenience target to debug the game. This requires all game assets to be in
# the specified working directory
add_custom_target(debug_overture
    gdb $<TARGET_FILE:Overture>
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/redist)
