#ifndef BRANE_VERSION_H
#define BRANE_VERSION_H

namespace brane {
    constexpr std::string_view PROJECT_NAME = "Brane";
    constexpr std::string_view PROJECT_DESCRIPTION = "";
    constexpr std::string_view PROJECT_REPO = "https://github.com/skyeBreach/brane";

    constexpr std::string_view AUTHOR_ORGANIZATION = "skyeBreach";
    constexpr std::string_view AUTHOR_DOMAIN = "https://github.com/skyeBreach";
    constexpr std::string_view AUTHOR_MAINTAINER = "skyeBreach";
    constexpr std::string_view AUTHOR_EMAIL = "skyebreach@proton.me";

    constexpr unsigned short int VERSION_MAJOR = 0;
    constexpr unsigned short int VERSION_MINOR = 1;
    constexpr unsigned short int VERSION_PATCH = 0;

    constexpr std::string_view VERSION = "0.1.0";
    constexpr std::string_view NAME_VERSION = "Brane v0.1.0";
} // namespace brane

#endif // BRANE_VERSION_H

