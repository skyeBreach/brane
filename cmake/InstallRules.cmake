# Project-wide Install Rules

# ================================================================================================ #
# Guards and Imports

include_guard(GLOBAL)

if(CMAKE_SKIP_INSTALL_RULES)
    return()
endif()

# ================================================================================================ #
# Source Code Rules

# Install the src files if we are including them
if(BRANE_INSTALL_SOURCE)
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/src/
        DESTINATION src
    )
endif()

# Install the app/bin files if we are including them
if(BRANE_INSTALL_APP)
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/app/
        DESTINATION app
    )
endif()

# ================================================================================================ #

