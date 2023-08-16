cmake_minimum_required(VERSION 3.21)
project(test_cpp
  VERSION "0.1.0"
  DESCRIPTION "cpp template project"
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)

# Set root to ffmpeg installed directory in your system
set(ffmpeg_ROOT ${PROJECT_BINARY_DIR}/3rdparty)
# make use Findffmpeg.cmake script
find_package(ffmpeg REQUIRED)
if (NOT ffmpeg_FOUND)
   message(FATAL_ERROR "Package ffmpeg not found")
endif (NOT ffmpeg_FOUND)

add_executable(main main.cpp)
#add_dependencies(main ffmpeg)
target_include_directories(main
    PRIVATE
    ${PROJECT_SOURCE_DIR}/include
)

target_link_libraries(main
    PRIVATE ffmpeg
)

install(TARGETS main)
