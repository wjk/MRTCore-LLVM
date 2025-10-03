set(CMAKE_SYSTEM_NAME Windows)

find_program(CMAKE_C_COMPILER aarch64-w64-mingw32-clang REQUIRED)
find_program(CMAKE_CXX_COMPILER aarch64-w64-mingw32-clang++ REQUIRED)
find_program(WINDRES_EXECUTABLE aarch64-w64-mingw32-windres REQUIRED)

add_definitions(-D_M_ARM64)
