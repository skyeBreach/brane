# Project-wide Install Rules

# ================================================================================================ #
# Guards and Imports

include_guard(GLOBAL)

if(CMAKE_SKIP_INSTALL_RULES)
    return()
endif()

# ================================================================================================ #
#

# TODO: Will also need an app sourc

if(BRANE_INSTALL_SOURCE)
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/src/
        DESTINATION ${BRANE_INSTALL}/src
    )
endif()

# ================================================================================================ #

