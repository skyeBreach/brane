# Project-wide Install Config

# ================================================================================================ #
# Guards and Imports

include_guard(GLOBAL)

if(CMAKE_SKIP_INSTALL_RULES)
    return()
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# ================================================================================================ #
# Common Path Variables

# Set install path for both dev mode (absolute) and non dev (relative to prefix)
if(BRANE_DEVELOPER_MODE AND CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX
        "${PROJECT_SOURCE_DIR}/install"
        CACHE STRING "" FORCE
    )
else()
    set(CMAKE_INSTALL_PREFIX
        "${CMAKE_INSTALL_PREFIX}/brane"
        CACHE STRING "" FORCE
    )
endif()

# ================================================================================================ #

