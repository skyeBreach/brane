# Brane Main App Executable

# ================================================================================================ #
# Target Definition

add_executable(brane_executable main.cpp)

target_link_libraries(brane_executable Core)

set_property(TARGET brane_executable PROPERTY OUTPUT_NAME "brane")

# ================================================================================================ #
# Install Rules

# Install the executable(s) to the bin directory
install(TARGETS brane_executable
    DESTINATION bin
)

# ================================================================================================ # w
