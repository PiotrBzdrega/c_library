# CMakeLists.txt

cmake_minimum_required(VERSION 3.12)
project(clibrary)

# Define the source file
set(SOURCE_FILES c_library.c)

# Generate the DLL
add_library(clibrary SHARED ${SOURCE_FILES})

# Set compiler options for position-independent code
set_target_properties(clibrary PROPERTIES POSITION_INDEPENDENT_CODE ON)
