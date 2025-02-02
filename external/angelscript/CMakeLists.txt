project(angelscript
    VERSION 2.7.1.1 # Actually 2.7.1b, but CMake only allows integers
    LANGUAGES CXX
    HOMEPAGE_URL https://www.angelcode.com/angelscript/
)

add_library(angelscript-engine
    src/as_anyobject.cpp
    src/as_arrayobject.cpp
    src/as_builder.cpp
    src/as_bytecode.cpp
    src/as_callfunc.cpp
    src/as_callfunc_mips.cpp
    src/as_callfunc_ppc.cpp
    src/as_callfunc_sh4.cpp
    src/as_callfunc_x86.cpp
    src/as_compiler.cpp
    src/as_context.cpp
    src/as_configgroup.cpp
    src/as_datatype.cpp
    src/as_gcobject.cpp
    src/as_generic.cpp
    src/as_module.cpp
    src/as_objecttype.cpp
    src/as_outputbuffer.cpp
    src/as_parser.cpp
    src/as_restore.cpp
    src/as_scriptcode.cpp
    src/as_scriptengine.cpp
    src/as_scriptfunction.cpp
    src/as_scriptnode.cpp
    src/as_scriptstruct.cpp
    src/as_string.cpp
    src/as_string_util.cpp
    src/as_thread.cpp
    src/as_tokenizer.cpp
    src/as_typeinfo.cpp
    src/as_variablescope.cpp
)

# AngelScript apparently does not strictly adhere to memory alignment
# requirements, causing crashes in optimized libraries that depend on it (such
# as libvorbis), so we need to compile the engine using AS_MAX_PORTABILITY.
# HPL1 Engine currently uses the value of this definition (to determine how to
# register functions with the script engine), so for now we need to propagate
# the definition to consumers.
target_compile_definitions(angelscript-engine
    PUBLIC AS_MAX_PORTABILITY
)

target_include_directories(angelscript-engine
    PUBLIC include
)

# Let's add an alias to link against the engine, because in the future we may
# want to expose the 'scriptstring' extra, which is currently vendored by HPL1.
add_library(AngelScript::Engine ALIAS angelscript-engine)
