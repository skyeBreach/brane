# As this defines project options it can only be run once
include_guard(GLOBAL)

# Imports required by this module
include(CMakeDependentOption)

# ================================================================================================ #
# System Information

# Store the system type in its own variable, for use by version.h
message ("-- System: ${CMAKE_SYSTEM_NAME}")
if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(LINUX true)
else ()
    set(UNKNOWN true)
endif()

# ================================================================================================ #
# Utility Variables

# Set the verbosity based on the GET_MESSAGE_LOG_LEVEL
cmake_language(GET_MESSAGE_LOG_LEVEL LOG_LEVEL)

# Fetch the `multi config` checking property down
get_cmake_property(GENERATOR_IS_MULTI_CONFIG BRANE_IS_MULTI_CONFIG)
if(BRANE_IS_MULTI_CONFIG)
    message(VERBOSE "Generator Config: Multi")
else()
    message(VERBOSE "Generator Config: Single")
endif()

# Check to see if this project is being included by another project
if(NOT DEFINED BRANE_IS_MASTER_PROJECT)
    set(BRANE_IS_MASTER_PROJECT OFF)
    if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
        set(BRANE_IS_MASTER_PROJECT ON)
    endif()
endif()

# ================================================================================================ #
# Project Options

# Option: Developer Mode
# These 'Developer Mode' settings are only relevant for developer(s) of this project.
# Developer Mode can be activated by users of the project but is set to an advanced option as it
# is not recommended.
option(
    BRANE_DEVELOPER_MODE
    "Enable the developer mode for ${META_PROJECT_NAME}."
    ${PROJECT_IS_TOP_LEVEL}
)
if(NOT PROJECT_IS_TOP_LEVEL)
    mark_as_advanced(BRANE_DEVELOPER_MODE)
endif()

option(BRANE_INSTALL_SOURCE
    "Install all source code modules to the 'src' directory"
    ON
)

# ================================================================================================ #
# Development Opttions

if(BRANE_DEVELOPER_MODE)
    # Code Linting
    option(BRANE_ENABLE_CODE_LINTING
        "Enable the code linter (Clang-Tidy)"
        ON
    )

    # Compilation Caching
    # It speeds up recompilation by caching previous compilations and detecting when the same
    # compilation is being done again.
    option(BRANE_ENABLE_CACHING
        "Enables compilation caching through the Ccache module"
        OFF
    )
endif()

# ================================================================================================ #

