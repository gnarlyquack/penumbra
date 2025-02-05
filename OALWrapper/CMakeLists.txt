set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/CMakeScripts)

option(FORCE32 "Force a 32 bit build on 64bit linux" OFF)

find_package(OGG)
find_package(Vorbis)
if(NOT APPLE)
    find_package(VorbisFile)
endif()
find_package(OpenAL)

list(APPEND OALWRAPPER_INCLUDE_PATHS
    PRIVATE ${OGG_INCLUDE_DIR}
    PRIVATE ${VORBIS_INCLUDE_DIR}
    PUBLIC ${OPENAL_INCLUDE_DIR}
)
if(VORBISFILE_INCLUDE_DIR)
    list(APPEND OALWRAPPER_INCLUDE_PATHS
        PRIVATE ${VORBISFILE_INCLUDE_DIR}
    )
endif()

list(APPEND OALWRAPPER_INCLUDE_PATHS
    PUBLIC include
)
if(EXTRA_INCLUDE_DIR)
    list(APPEND OALWRAPPER_INCLUDE_PATHS
        PRIVATE ${EXTRA_INCLUDE_DIR}
    )
endif()
set(all_sources
    sources/OAL_AudioData.cpp
    sources/OAL_Buffer.cpp
    sources/OAL_Device.cpp
    sources/OAL_Effect.cpp
    sources/OAL_Effect_Reverb.cpp
    sources/OAL_EffectSlot.cpp
    sources/OAL_EFX.cpp
    sources/OAL_EFXManager.cpp
    sources/OAL_Filter.cpp
    sources/OAL_Helper.cpp
    sources/OAL_Init.cpp
    sources/OAL_Loaders.cpp
    sources/OAL_LoggerObject.cpp
    sources/OAL_OggSample.cpp
    sources/OAL_OggStream.cpp
    sources/OAL_WAVSample.cpp
    sources/OAL_CustomStream.cpp
    sources/OAL_Playback.cpp
    sources/OAL_Sample.cpp
    sources/OAL_Source.cpp
    sources/OAL_SourceManager.cpp
    sources/OAL_Stream.cpp
    sources/OAL_Types.cpp
)

set(all_includes
    include//OALWrapper/OAL_AudioData.h
    include//OALWrapper/OAL_Buffer.h
    include//OALWrapper/OAL_CustomStream.h
    include//OALWrapper/OAL_Device.h
    include//OALWrapper/OAL_Effect.h
    include//OALWrapper/OAL_Effect_Reverb.h
    include//OALWrapper/OAL_EffectSlot.h
    include//OALWrapper/OAL_EFX.h
    include//OALWrapper/OAL_EFXManager.h
    include//OALWrapper/OAL_Filter.h
    include//OALWrapper/OAL_Funcs.h
    include//OALWrapper/OAL_Helper.h
    include//OALWrapper/OAL_Init.h
    include//OALWrapper/OAL_Loaders.h
    include//OALWrapper/OAL_LoggerObject.h
    include//OALWrapper/OAL_LowLevelObject.h
    include//OALWrapper/OAL_OggSample.h
    include//OALWrapper/OAL_OggStream.h
    include//OALWrapper/OAL_Playback.h
    include//OALWrapper/OAL_Sample.h
    include//OALWrapper/OAL_Source.h
    include//OALWrapper/OAL_SourceManager.h
    include//OALWrapper/OAL_Stream.h
    include//OALWrapper/OAL_Types.h
    include//OALWrapper/OAL_WAVSample.h
)

add_library(OALWrapper STATIC
    ${all_sources}
    ${all_includes}
)
target_link_libraries(OALWrapper
    PRIVATE
        ${VORBISFILE_LIBRARY}
        ${VORBIS_LIBRARY}
        ${OGG_LIBRARY}
        ${OPENAL_LIBRARY}
        SDL2::SDL2
)
target_include_directories(OALWrapper
    ${OALWRAPPER_INCLUDE_PATHS}
)

add_executable(SimpleTest EXCLUDE_FROM_ALL tests/Simple/main.cpp)
target_link_libraries(SimpleTest OALWrapper)

add_executable(PlaySound EXCLUDE_FROM_ALL tests/PlaySound/main.cpp)
target_link_libraries(PlaySound OALWrapper)

add_executable(Playlist EXCLUDE_FROM_ALL tests/Playlist/main.cpp)
target_link_libraries(Playlist OALWrapper)

add_executable(CustomStream EXCLUDE_FROM_ALL tests/CustomStream/main.cpp)
target_link_libraries(CustomStream OALWrapper)
