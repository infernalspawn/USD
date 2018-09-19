if (APPLE)   
    message(WARNING "Skipping third_party/houdini because the Houdini plugin is not supported on MacOS")
    return()
elif (WIN32)
    message(WARNING "Skipping third_party/houdini because the Houdini plugin is not supported on Windows")
    return()
endif()

set(PXR_INSTALL_SUBDIR "third_party/houdini")

add_definitions( 
    -DHOUDINI_API_VERSION=${HOUDINI_MAJOR_VERSION}${HOUDINI_MINOR_VERSION}
    -DVERSION="${HOUDINI_VERSION}"
    -DHOUDINI_DOT_VERSION=${HOUDINI_BUILD_VERSION} )

# generic OS independend definitions
add_definitions( -DAMD64 -DSIZEOF_VOID_P=8 -DFBX_ENABLED=1 -DOPENCL_ENABLED=1 -DOPENVDB_ENABLED=1 -DSESI_LITTLE_ENDIAN)


if (WIN32)
    add_definitions(-DI386 -DWIN32 -DSWAP_BITFIELDS -D_WIN32_WINNT=0x0502 -DNOMINMAX -DSTRICT -DWIN32_LEAN_AND_MEAN -D_USE_MATH_DEFINES -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -D_SCL_SECURE_NO_WARNINGS -DSESI_LITTLE_ENDIAN -DHBOOST_ALL_NO_LIB -DEIGEN_MALLOC_ALREADY_ALIGNED=0 -DMAKING_DSO)
else ()
    # linux / osx specific definitions ?
    add_definitions(-Wall -Wno-parentheses -Wno-sign-compare -Wno-reorder -Wno-uninitialized -Wunused -Wno-unused-parameter -Wno-unused-local-typedefs -Wno-empty-body)
    add_definitions(-D_GNU_SOURCE -DLINUX  -DMAKING_DSO -DENABLE_THREADS -DUSE_PTHREADS -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DGCC4 -DGCC3 )
	add_definitions(-fpermissive  -fno-strict-aliasing)
endif ()

add_subdirectory(lib)
add_subdirectory(plugin)
