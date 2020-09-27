set(Sources
src/Application.cpp
)

add_library(${LIB_NAME} SHARED
${Sources}
)

target_link_libraries( ${LIB_NAME}
-lpthread
)

# set(CMAKE_CXX_CLANG_TIDY "clang-tidy;checks=-*")
add_executable(${EXE_NAME}
src/main.cpp
)
# add_coverage(${EXE_NAME})
target_link_libraries( ${EXE_NAME}
${LIB_NAME}
)

# add_coverage(${LIB_NAME})
# set_property(TARGET ${LIB_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)

add_custom_command(
  TARGET ${PROJECT_NAME} POST_BUILD 
  COMMAND ${CMAKE_COMMAND} -E copy    
  ${CMAKE_SOURCE_DIR}/Banner.txt 
  ${CMAKE_BINARY_DIR}/Banner.txt
)  

# some test        
# list(APPEND LCOV_REMOVE_PATTERNS "/usr/")

# Installation
# install(CODE "MESSAGE(\"Installing ${PROJECT_NAME} \")")
# install(TARGETS  ${PROJECT_NAME}
#         RUNTIME DESTINATION bin
#         LIBRARY DESTINATION lib
#         ARCHIVE DESTINATION lib)