cmake_minimum_required(VERSION 2.8.11)
project(stm32-pack)

include(InstallRequiredSystemLibraries)

# List of files to install
file(GLOB scripts "bin/*")
file(GLOB cmake "cmake")
file(GLOB template "template")

# Installing required files
install(PROGRAMS ${scripts} DESTINATION bin)
install(DIRECTORY ${cmake} DESTINATION share/${PROJECT_NAME})
install(DIRECTORY ${template} DESTINATION share/${PROJECT_NAME})

# Get distribution name
execute_process(COMMAND lsb_release -is OUTPUT_VARIABLE TMP_DISTRO)
# Remove trailing \n
string(REGEX REPLACE "\n" "" DISTRO ${TMP_DISTRO})
message (STATUS "Detected linux distribution '${DISTRO}'")
if (DISTRO STREQUAL Ubuntu)
	set(CPACK_GENERATOR "DEB")
	set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_SOURCE_DIR}/postinst")
	set(CPACK_DEBIAN_PACKAGE_DEPENDS "gcc-arm-none-eabi, g++, cmake, python-setuptools")
elseif (${DISTRO} STREQUAL "Fedora")
	set(CPACK_GENERATOR "RPM")
else()
	message("Unsupported linux distribution: ${DISTRO}")
endif()

set(CPACK_PACKAGE_CONTACT "Toplica Tanasković <toplicius@gmail.com>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "STM32 project templates")
set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME}")
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VENDOR "ETF Beograd")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_PACKAGING_INSTALL_PREFIX "/usr/local")
include(CPack)

