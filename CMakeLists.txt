cmake_minimum_required(VERSION 3.14)
project(MRTCore)

include(windres.cmake)

set(CMAKE_CXX_STANDARD 23)

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    # This is needed so that libc++ can select a compatible va_args implementation.
    add_definitions(-D__GNUC__)
endif()

add_subdirectory(wil)
add_subdirectory(MRM)
