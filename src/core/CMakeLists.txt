# Brane Core Library

# ================================================================================================ #
# Target Definition and Files

# Define the `Core` base target and its namespaced target
add_library(Core STATIC
    src/cli.cpp
)
add_library(Brane::Core ALIAS Core)

# Sets the locations to search for public and private includes
target_include_directories(Core
	PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>"
    PRIVATE
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>"
)

# ================================================================================================ #
# Target Properties

# Set general properties for the target
set_target_properties(Core
    PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        CXX_VISIBILITY_PRESET hidden
        VISIBILITY_INLINES_HIDDEN YES
        EXPORT_NAME core
        OUTPUT_NAME core
        PREFIX ""
)

# Set the C++ standard to use for this project
target_compile_features(Core PUBLIC cxx_std_17)


configure_file(
    ${PROJECT_SOURCE_DIR}/cmake/templates/version.h.in
    ${CMAKE_CURRENT_SOURCE_DIR}/include/version.h
    @ONLY
)

# ================================================================================================ #
# Generate Utility and Helper Files

# Generate Export Macros
include(GenerateExportHeader)
generate_export_header(Core
    EXPORT_FILE_NAME ${CMAKE_CURRENT_BINARY_DIR}/Core_export.h
)

# ================================================================================================ #
# Submodule Install Rules

# As this is the last thing we can return if we don't need to install
if(CMAKE_SKIP_INSTALL_RULES)
    return()
endif()

# TODO: Comment
#
install(TARGETS Core
    DESTINATION ${BRANE_INSTALL_RELEASE_LIBDIR}
)

# ================================================================================================ #

