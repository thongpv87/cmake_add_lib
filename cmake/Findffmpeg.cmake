find_path(ffmpeg_INCLUDE_DIR ares.h #replace by a header file in ffmpeg include dir
    ${ffmpeg_ROOT}/include
    /usr/local/include
    /usr/local/include/ffmpeg
    /usr/include
    DOC "The directory where ffmpeg.h resides.")


find_library(ffmpeg_LIB
  NAMES libcares.so # add more sofile here
  PATHS
  ${ffmeg_ROOT}/lib64/ #modify this
  /usr/local/lib
  /usr/local/lib/ffmpeg
  /usr/lib
  DOC "The ffmpeg library")


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ffmpeg REQUIRED_VARS ffmpeg_INCLUDE_DIR ffmpeg_LIB)

mark_as_advanced(ffmpeg_INCLUDE_DIRS)

add_library(ffmpegd SHARED IMPORTED GLOBAL)
set_target_properties(ffmpegd PROPERTIES IMPORTED_LOCATION ${ffmpeg_LIB})
target_include_directories(ffmpegd INTERFACE ${ffmpeg_INCLUDE_DIR})
