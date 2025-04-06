set dotenv-load
set unstable
set shell := ["zsh", "-cu"]

# ================================================================================================ #
# Project Configration Helpers

project_path := justfile_directory()

# Auto-Generated and Build Paths, or 'out' paths
dir_build   := project_path/"build"
dir_install := project_path/"install"

# Important Project Paths
dir_assets  := project_path/"assets"
dir_cmake   := project_path/"cmake"
dir_docs    := project_path/"docs"
dir_libs    := project_path/"libs"
dir_scripts := project_path/"scripts"
dir_src     := project_path/"src"

# TODO: Use a .sh script that pulls the info from the CMakeCache.txt instead of CMakeLists.txt
# Project Info
project_name    := `rg -PNIU --trim 'CMakeLists.txt' -e '(?<=project\(\n).*'`
project_version := shell(dir_scripts/"version.sh")

# ================================================================================================ #
# Command-Line Helpers

# String prefix used by all error messages that the logger outputs to the term
error_msg := style("error") + "Error: " + NORMAL + BOLD

# Helper terminal command prefix to allow for easy just reciper calling
call_recipe := just_executable() + " --justfile=" + justfile()

# ================================================================================================ #
# Project Info

# Output usage and helpful command info for the project
help:
    @just --list --alias-style=separate --justfile {{justfile()}}
_default: help
    echo "Name: "  ${name}

# Output the projects version (SemVer) numberc
@version:
    echo "{{project_version}}"

# Prints all info relating to this project
[group("info")]
info: && project-info system-info

# Output information on the projects current build/state
[group("info")]
@project-info:
    echo $'\n{{BOLD}}{{UNDERLINE}}Project Info{{NORMAL}}'
    echo "    {{BOLD}}Name:{{NORMAL}} {{project_name}}"
    echo "    {{BOLD}}Version:{{NORMAL}} {{project_version}}"

# Output current system information such as OS and Architecture
[group("info")]
@system-info:
    echo $'\n{{BOLD}}{{UNDERLINE}}System Info{{NORMAL}}'
    echo "    {{BOLD}}Architecture:{{NORMAL}} {{arch()}}"
    echo "    {{BOLD}}OS:{{NORMAL}} {{os()}}"
    echo "    {{BOLD}}OS Family:{{NORMAL}} {{os_family()}}"

# ================================================================================================ #
# File System Management

# Removes the provided files/dirs and cleans their data
[group("file-system")]
@clean-targets +targets:
    {{dir_scripts}}/clean-targets.sh {{targets}}

# Clean out all generated files (bui1ld, cache, etc) from the project
[group("file-system")]
@clean: ( clean-targets dir_build dir_install )

# ================================================================================================ #
# Setup and Configuration

# Generates the config data for CMake
[group("config")]
config:
    cmake -S . -B {{dir_build}} -G "Ninja Multi-Config"

# Cleans and then reconfigures the cmake project
[group("config")]
reconfig: clean config

# ================================================================================================ #
# Building and Compilation

# Build the CMake-generated project binary tree, and creates a local install folder
[group("build")]
build:
    cmake --build {{dir_build}} --config Debug --target all
    cmake --install {{dir_build}} --config Debug

# Cleans, creates a cmake project config, and then builds the project
[group("build")]
rebuild: clean config build

# ================================================================================================ #
# Development Utilities

# Helper recipe to call the in-dev app executable binary
[group("development")]
@brane +args='':
    {{dir_install}}/bin/brane {{args}}

# ================================================================================================ #

