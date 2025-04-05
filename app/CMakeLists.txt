# Brane Main App Executable

# ================================================================================================ #
# Target Definition

add_executable(brane_executable main.cpp)

target_link_libraries(brane_executable Core)

set_property(TARGET brane_executable PROPERTY OUTPUT_NAME "brane")

# ================================================================================================ #
# Install Rules

# TODO: Comment
#
install(TARGETS brane_executable
    DESTINATION ${BRANE_INSTALL_RELEASE_BINDIR}
)

# ================================================================================================ #

