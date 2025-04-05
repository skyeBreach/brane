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
    set(BRANE_INSTALL_ROOT
        "${PROJECT_SOURCE_DIR}/install"
        CACHE STRING ""
    )
else()
    set(BRANE_INSTALL_ROOT
        "brane"
        CACHE STRING ""
    )
endif()
set_property(CACHE BRANE_INSTALL_ROOT PROPERTY TYPE PATH)

# TODO: Comment
#
set(BRANE_INSTALL_RELEASE
    "${BRANE_INSTALL_ROOT}/release/${META_VERSION}"
    CACHE STRING ""
)
set_property(CACHE BRANE_INSTALL_RELEASE PROPERTY TYPE PATH)

# TODO: Comment
#
set(CMAKE_INSTALL_INCLUDEDIR
    "include/Brane-${PROJECT_VERSION}"
    CACHE STRING ""
)
set_property(CACHE CMAKE_INSTALL_INCLUDEDIR PROPERTY TYPE PATH)

# TODO: COMMENT
#
set(BRANE_INSTALL_RELEASE_LIBDIR
    "${BRANE_INSTALL_RELEASE}/lib"
    CACHE STRING ""
)
set_property(CACHE BRANE_INSTALL_RELEASE_LIBDIR PROPERTY TYPE PATH)

# TODO: COMMENT
#
set(BRANE_INSTALL_RELEASE_BINDIR
    "${BRANE_INSTALL_RELEASE}/bin"
    CACHE STRING ""
)
set_property(CACHE BRANE_INSTALL_RELEASE_BINDIR PROPERTY TYPE PATH)

# ================================================================================================ #
#

# TODO: Will also need an app sourc

if(BRANE_INSTALL_SOURCE)
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/src/
        DESTINATION ${BRANE_INSTALL_RELEASE}/src
    )
endif()

# ================================================================================================ #

