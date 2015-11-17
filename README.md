# STM32F4-PACK
The goal of this project is to create RPM and DEB packages for easier setup of the embeded arm development toolchains and utilities, and template project creation. Currently only Fedora and Ubuntu are supported.

## Creating packages
On your linux distribution of choice:

1. Check out the source code
2. Create build directory outside the source code
3. Execute 
	`cmake <path_to_the_source_code>`
4. Execute `make`

Depending of the distribution you use the RPM or DEB package will be created.
That package you can copy to other machines, or put it in a repository, and install. The installation will automatically pull all the dependencies and will build [mikroe-uhb](https://github.com/thotypous/mikroe-uhb) tool for flashing devices via USB.

### Important information installing Ubuntu package
If you are using Ubuntu, the apt-get does not support installing local packages and installing via `dpkg -i` will not pull dependencies. To fix this just execute `apt-get -f install`.

## Usage
To create project template execute:

`create-stm32f4-project -n <project_name>`

This will create a directory called **project_name** with template project. Everything is already set up for building with CMake, all you have to do is to edit the code.
