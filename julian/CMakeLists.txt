cmake_minimum_required(VERSION 3.22)
project(cuda_memory LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CUDA_STANDARD 20)

enable_testing()

add_subdirectory(src)
add_subdirectory(tests)