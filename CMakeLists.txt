cmake_minimum_required(VERSION 3.12)
project(test_cpp
  VERSION "0.1.0"
  DESCRIPTION "cpp template project"
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)

# Download and install ffmpeg
# Don't replace <SOURCE_DIR>, <INSTALL_DIR> ... in this command
include(${CMAKE_ROOT}/Modules/ExternalProject.cmake)
ExternalProject_Add(ffmpeg
  GIT_REPOSITORY  https://github.com/c-ares/c-ares.git # replace by ffmpeg
  GIT_TAG "main" #git branch
  PREFIX ${PROJECT_BINARY_DIR}/3rdparty
  CONFIGURE_COMMAND cmake <SOURCE_DIR> -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> # can be replace by st like ./configure --prefix = ...
  BUILD_COMMAND make <SOURCE_DIR>
  INSTALL_COMMAND make install
)

ExternalProject_Get_Property(ffmpeg INSTALL_DIR)
set(ffmpeg_ROOT ${INSTALL_DIR})
# make use Findffmpeg.cmake script
find_package(ffmpeg REQUIRED)
if (NOT ffmpeg_FOUND)
   message(FATAL_ERROR "Package ffmpeg not found")
endif (NOT ffmpeg_FOUND)

# add_library(ffmpegd SHARED IMPORTED GLOBAL)
# set_target_properties(ffmpegd PROPERTIES IMPORTED_LOCATION ${ffmpeg_LIB})
# target_include_directories(ffmpegd INTERFACE ${ffmpeg_INCLUDE_DIR})

add_executable(main main.cpp)
add_dependencies(main ffmpeg)
target_include_directories(main
    PRIVATE
    ${PROJECT_SOURCE_DIR}/include
    # ${INSTALL_DIR}/include
    # ${FFMPEG_INCLUDE_DIR}
)

target_link_libraries(main
    PRIVATE ffmpegd
        # ${INSTALL_DIR}/lib64/libcares.so
)
