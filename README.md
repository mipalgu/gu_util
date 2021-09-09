gu_util
=======

A simple convenience library for POSIX C/C++ code.

## Online Documentation

 * [Files](https://mipalgu.github.io/gu_util/files.html)
   - [gu_util.h](https://mipalgu.github.io/gu_util/gu__util_8h.html)
   - [gu_util.cpp](https://mipalgu.github.io/gu_util/gu__util_8cpp.html)
 * [Module](https://mipalgu.github.io/gu_util/globals_defs.html)
   - [Functions](https://mipalgu.github.io/gu_util/globals_func.html)
   - [Macros](https://mipalgu.github.io/gu_util/globals_defs.html)

## Prerequisites

You need a posix system a C/C++ compiler, [cmake](https://cmake.org),
and a build system supported by [cmake](https://cmake.org), such as
[Ninja](https://ninja-build.org) or
[gmake](https://www.gnu.org/software/make/).

## Building

To build, you simply create a build directory (e.g. `build.ninja`)
using [cmake](https://cmake.org), then use your build system to
build and install. Here is an example using
[Ninja](https://ninja-build.org):

	mkdir ../build.ninja
	cd ../build.ninja
	cmake -G Ninja ../gu_util
	ninja
	ninja install

If you require root permissions, run `ninja install` as root,
e.g. by using [sudo](https://www.sudo.ws):

	sudo ninja install
