cmake_minimum_required (VERSION 2.6)
project (HPL)

set(HPL_VERSION_MAJOR 1)
set(HPL_VERSION_MINOR 0)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/include
	${CMAKE_CURRENT_SOURCE_DIR}/../OALWrapper/include
	${CMAKE_CURRENT_SOURCE_DIR}/../dependencies/include
)
file(GLOB_RECURSE all_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/sources/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/sources/*.c
)
# Removed Sources
file(GLOB_RECURSE to_remove_all
    win32.cpp
    Video*Theora.cpp
    )
list(REMOVE_ITEM all_sources
    ${to_remove_all})
list(REMOVE_DUPLICATES all_sources)

add_library(HPL STATIC ${all_sources})
# Penumbra Overture appears to use OpenGL 1.4, which requires legacy APIs
target_compile_definitions(HPL PRIVATE GL_GLEXT_LEGACY GLX_GLXEXT_LEGACY)

add_library(Newton STATIC IMPORTED)
set_target_properties(Newton PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../dependencies/lib/linux/libNewton.a)

#
# AngelScript
#

add_library(angelscript STATIC IMPORTED)

set_target_properties(angelscript PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../dependencies/lib/linux/libangelscript.a)

# HPL needs visibility of this definition since it modifies how it registers
# functions with the script engine.
target_compile_definitions(angelscript INTERFACE AS_MAX_PORTABILITY)

target_include_directories(angelscript INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/../dependencies/include)

# HPL exposes AngelScript's script engine function registration interface in a
# public header, so the AngelScript dependency needs to be propagated to
# targets linking to the game engine.
target_link_libraries(HPL PUBLIC angelscript)

add_library(SDLmain STATIC IMPORTED)
set_target_properties(SDLmain PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../dependencies/lib/linux/libSDLmain.a)
