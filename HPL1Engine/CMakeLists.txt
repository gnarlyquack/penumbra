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

target_link_libraries(HPL
    PUBLIC
        # HPL exposes AngelScript's script engine function registration
        # interface in a public header, so the AngelScript dependency needs to
        # be propagated to targets linking to the game engine.
        AngelScript::Engine
    PRIVATE
        SDL2::SDL2 SDL2::SDL2main SDL2_ttf SDL2_image
)
