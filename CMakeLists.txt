project(TICPP)
cmake_minimum_required(VERSION 2.8)

# Use the NEW policy for relative paths. https://cmake.org/cmake/help/v3.0/policy/CMP0015.html
# NEW = Convert relative paths to absolute paths by appending the relative path to CMAKE_CURRENT_SOURCE_DIR.
cmake_policy(SET CMP0015 NEW)

add_definitions(-DTIXML_USE_TICPP)

SET(TICPP_SRCS ticpp.cpp tinyxml.cpp tinystr.cpp tinyxmlparser.cpp tinyxmlerror.cpp)
SET(TICPP_HS ticpp.h ticppapi.h ticpprc.h tinystr.h tinyxml.h)

if(UNIX)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
endif()

if(WITH_SHARED)
  add_library(ticpp SHARED ${TICPP_SRCS})
  message("Building shared library")
else()
  add_library(ticpp STATIC ${TICPP_SRCS})
  message("Building static library")
endif()

install(FILES ${TICPP_HS} DESTINATION include)
install(TARGETS ticpp DESTINATION lib)
