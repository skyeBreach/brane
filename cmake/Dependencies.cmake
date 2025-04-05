# ================================================================================================ #
# CPM (Dependency Management) Configuration

include(CPM)

# ================================================================================================ #
# Third-Party CMake Modules

# CCache - A compiler cache that can drastically improve build times
CPMAddPackage(
    NAME Ccache.cmake
    GITHUB_REPOSITORY TheLartians/Ccache.cmake
    VERSION 1.2.5
)

# ================================================================================================ #
