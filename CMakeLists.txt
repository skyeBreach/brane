# TODO: Check if this is the version of cmake we wanna use

# ================================================================================================ #
# Pre-Project Config

cmake_minimum_required(VERSION 3.31 FATAL_ERROR)

# Disable all in-source builds to avoid source tree corruption
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
    message(
        FATAL_ERROR
        "In-source builds are not supported."
        "Please read the BUILDING document before trying to build this project."
        "You may need to delete 'CMakeCache.txt' and 'CMakeFiles/' first."
    )
endif()

# Allow CMake to search for project-specific modules
list(APPEND CMAKE_MODULE_PATH
	"${CMAKE_CURRENT_SOURCE_DIR}/cmake"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake"
)

# Generates `compile_commands.json`. Required by tools like clang-tidy and clangd LSP server.
# See,
#   - https://clangd.llvm.org/installation#compile_commandsjson
#   - https://clang.llvm.org/docs/JSONCompilationDatabase.html
#   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

# Specifies the available build types (configs) on multi-config generators.
# See,
#   - https://cmake.org/cmake/help/latest/variable/CMAKE_CONFIGURATION_TYPES.html
#   - https://cmake.org/cmake/help/latest/generator/Ninja%20Multi-Config.html
#   - https://ninja-build.org/manual.html
set(CMAKE_CONFIGURATION_TYPES "Debug;RelWithDebInfo;Release" CACHE STRING "" FORCE)

# ================================================================================================ #
# Project Configuration

# Define the project from the previously developer defined vars
project(
    Brane
    VERSION 0.1.0
    LANGUAGES C CXX
)

# Developer Defined Meta Information About the Project
set(META_PROJECT_NAME           "${PROJECT_NAME}")
set(META_PROJECT_DESCRIPTION    "")
set(META_AUTHOR_ORGANIZATION    "skyeBreach")
set(META_GITHUB_REPO            "https://github.com/skyeBreach/brane")
set(META_AUTHOR_DOMAIN          "https://github.com/skyeBreach")
set(META_AUTHOR_MAINTAINER      "skyeBreach")
set(META_AUTHOR_EMAIL           "skyebreach@proton.me")
set(META_VERSION_MAJOR          "${PROJECT_VERSION_MAJOR}")
set(META_VERSION_MINOR          "${PROJECT_VERSION_MINOR}")
set(META_VERSION_PATCH          "${PROJECT_VERSION_PATCH}")
set(META_VERSION                "${META_VERSION_MAJOR}.${META_VERSION_MINOR}.${META_VERSION_PATCH}")
set(META_NAME_VERSION           "${META_PROJECT_NAME} v${META_VERSION}")

# Transform project name into an upper and lowercase normalized C identifier
string(MAKE_C_IDENTIFIER ${META_PROJECT_NAME} META_PROJECT_ID)
string(TOUPPER ${META_PROJECT_ID} META_PROJECT_ID)
string(TOLOWER ${META_PROJECT_ID} META_PROJECT_ID_LOWER)

# ================================================================================================ #
# Project-wide C and CXX Standards

# When the C++ standard is not defined we need it to set a sensible default
if(NOT DEFINED CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    message(STATUS "CXX Standard Set to the Default Value (c++${CMAKE_CXX_STANDARD})")
endif()

# When the C standard is not defined we need it to set a sensible default
if(NOT DEFINED CMAKE_C_STANDARD)
    set(CMAKE_C_STANDARD 17)
    set(CMAKE_C_STANDARD_REQUIRED ON)
    message(STATUS "C Standard Set to the Default Value (c${CMAKE_C_STANDARD})")
endif()

# Disable compiler-specific extensions project-wide for increased portability
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_EXTENSIONS OFF)
message(STATUS "Globally Disable Compiler-Specific C++ and C Extensions")

# ================================================================================================ #
# Project Global Modules

# Import module that defines all project options
include(ProjectOptions)

# Import all project dependencies
include(Dependencies)

# TODO: Comment
#
include(InstallConfig)

# ================================================================================================ #
# Project Source Code SubModules

add_subdirectory(src)
add_subdirectory(app)

# ================================================================================================ #
# Project Install Rules

# TODO: Comment
#
include(InstallRules)

# ================================================================================================ #

