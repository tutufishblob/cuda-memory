file(GLOB CUDA_TESTS "*.cu")

foreach(test_src ${CUDA_TESTS})
    get_filename_component(test_name ${test_src} NAME_WE)

    add_executable(${test_name} ${test_src})
    target_link_libraries(${test_name} PRIVATE cuda_allocator)

    target_include_directories(${test_name}
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/../src/cuda
    )

    set_target_properties(${test_name} PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON
    )

endforeach()