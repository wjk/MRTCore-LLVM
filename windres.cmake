function(target_win32_resources target)
    cmake_parse_arguments(RES "" "" "SOURCE_FILES;PREPROCESSOR_DEFINITIONS" ${ARGN})
    if(NOT RES_SOURCE_FILES)
        message(FATAL_ERROR "SOURCE_FILES must be specified when using target_win32_resources()")
    endif()

    foreach(def ${RES_PREPROCESSOR_DEFINITIONS})
        list(APPEND flags --define=${def})
    endforeach()

    foreach(file ${RES_SOURCE_FILES})
        get_filename_component(file_abs ${file} ABSOLUTE)
        list(APPEND sources ${file_abs})
    endforeach()

    set(output ${CMAKE_CURRENT_BINARY_DIR}/resources.obj)
    add_custom_command(OUTPUT ${output}
        COMMAND ${WINDRES_EXECUTABLE} ${flags} --codepage=65001 --output=${output} ${sources}
        DEPENDS ${sources}
        COMMENT "windres for ${target}" VERBATIM)
    target_sources(${target} PRIVATE ${output})
endfunction()
