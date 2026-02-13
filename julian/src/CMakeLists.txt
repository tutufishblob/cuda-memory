option(USE_BST_ALLOCATOR "Use BST-based pool allocator" ON)


add_library(type_defs INTERFACE)

target_include_directories(type_defs
  INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
    $<INSTALL_INTERFACE:include>
)

add_library(cuda_allocator_headers INTERFACE)

target_include_directories(cuda_allocator_headers
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src/cuda>
)

add_library(cuda_allocator STATIC
    cuda/RBTree.cu
    # cuda/poolAlloc.cu
    # cuda/poolAllocBST.cu
    )

    if (USE_BST_ALLOCATOR)
        target_sources(cuda_allocator PRIVATE cuda/poolAllocBST.cu)
        target_compile_definitions(cuda_allocator PUBLIC USE_POOL_ALLOC_BST)
    else()
        target_sources(cuda_allocator PRIVATE cuda/poolAlloc.cu)
        target_compile_definitions(cuda_allocator PUBLIC USE_POOL_ALLOC)
    endif()
    
    target_link_libraries(cuda_allocator PUBLIC cuda_allocator_headers type_defs)

set_target_properties(cuda_allocator PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON)