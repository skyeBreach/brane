# Project-wide Install Rules

# ================================================================================================ #
# Guards and Imports

include_guard(GLOBAL)

if(CMAKE_SKIP_INSTALL_RULES)
    return()
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# ================================================================================================ #
# Install Directories

# TODO: Comment
#
if(BRANE_DEVELOPER_MODE)
    set(BRANE_INSTALL
        "${PROJECT_SOURCE_DIR}/install"
        CACHE STRING ""
    )
else()
    set(BRANE_INSTALL
        "brane"
        CACHE STRING ""
    )
endif()
set_property(CACHE BRANE_INSTALL PROPERTY TYPE PATH)

# TODO: COMMENT
#
set(BRANE_INSTALL_LIBDIR
    "${BRANE_INSTALL}/lib"
    CACHE STRING ""
)
set_property(CACHE BRANE_INSTALL_LIBDIR PROPERTY TYPE PATH)

# TODO: COMMENT
#
set(BRANE_INSTALL_BINDIR
    "${BRANE_INSTALL}/bin"
    CACHE STRING ""
)
set_property(CACHE BRANE_INSTALL_BINDIR PROPERTY TYPE PATH)

# ================================================================================================ #
#

# TODO: Will also need an app sourc

if(BRANE_INSTALL_SOURCE)
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/src/
        DESTINATION ${BRANE_INSTALL}/src
    )
endif()

# ================================================================================================ #

