function(target_win32_resources target input)
    cmake_parse_arguments(RES "" "" "ADDITIONAL_INPUTS;PREPROCESSOR_DEFINITIONS" ${ARGN})

    foreach(def ${RES_PREPROCESSOR_DEFINITIONS})
        list(APPEND flags --define=${def})
    endforeach()

    get_filename_component(input_abs ${input} ABSOLUTE)
    list(APPEND sources ${input_abs})
    foreach(file ${RES_ADDITIONAL_INPUTS})
        get_filename_component(file_abs ${file} ABSOLUTE)
        list(APPEND sources ${file_abs})
    endforeach()

    get_filename_component(input_base ${input} NAME_WE)
    set(output ${CMAKE_CURRENT_BINARY_DIR}/${input_base}.o)

    add_custom_command(OUTPUT ${output}
        COMMAND ${WINDRES_EXECUTABLE} ${flags} --output=${output} ${sources}
        COMMENT "windres ${input}" VERBATIM)
    target_sources(${target} PRIVATE ${output})
endfunction()
