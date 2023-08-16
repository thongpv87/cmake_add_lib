find_path(ffmpeg_INCLUDE_DIR ares.h #replace by a header file in ffmpeg include dir
    /usr/local/include
    /usr/local/include/ffmpeg
    /usr/include
    DOC "The directory where ffmpeg.h resides.")


find_library(ffmpeg_LIB
  NAMES cares # add more sofile here
  PATHS
  /usr/local/lib
  /usr/local/lib/ffmpeg
  /usr/lib
  DOC "The ffmpeg library")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ffmpeg REQUIRED_VARS ffmpeg_INCLUDE_DIR ffmpeg_LIB)

mark_as_advanced(ffmpeg_INCLUDE_DIRS)

add_library(ffmpeg STATIC IMPORTED GLOBAL)
set_target_properties(ffmpeg PROPERTIES IMPORTED_LOCATION ${ffmpeg_LIB})
target_include_directories(ffmpeg INTERFACE ${ffmpeg_INCLUDE_DIR})
