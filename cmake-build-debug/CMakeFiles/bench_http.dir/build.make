# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "F:\Program Files\JetBrains\apps\CLion\ch-0\182.3684.76\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "F:\Program Files\JetBrains\apps\CLion\ch-0\182.3684.76\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Cthulhu\Desktop\libevent

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/bench_http.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bench_http.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bench_http.dir/flags.make

CMakeFiles/bench_http.dir/test/bench_http.c.obj: CMakeFiles/bench_http.dir/flags.make
CMakeFiles/bench_http.dir/test/bench_http.c.obj: CMakeFiles/bench_http.dir/includes_C.rsp
CMakeFiles/bench_http.dir/test/bench_http.c.obj: ../test/bench_http.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/bench_http.dir/test/bench_http.c.obj"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\bench_http.dir\test\bench_http.c.obj   -c C:\Users\Cthulhu\Desktop\libevent\test\bench_http.c

CMakeFiles/bench_http.dir/test/bench_http.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bench_http.dir/test/bench_http.c.i"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Cthulhu\Desktop\libevent\test\bench_http.c > CMakeFiles\bench_http.dir\test\bench_http.c.i

CMakeFiles/bench_http.dir/test/bench_http.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bench_http.dir/test/bench_http.c.s"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\Cthulhu\Desktop\libevent\test\bench_http.c -o CMakeFiles\bench_http.dir\test\bench_http.c.s

# Object files for target bench_http
bench_http_OBJECTS = \
"CMakeFiles/bench_http.dir/test/bench_http.c.obj"

# External object files for target bench_http
bench_http_EXTERNAL_OBJECTS =

bin/bench_http.exe: CMakeFiles/bench_http.dir/test/bench_http.c.obj
bin/bench_http.exe: CMakeFiles/bench_http.dir/build.make
bin/bench_http.exe: lib/libevent_extra.a
bin/bench_http.exe: lib/libevent_core.a
bin/bench_http.exe: CMakeFiles/bench_http.dir/linklibs.rsp
bin/bench_http.exe: CMakeFiles/bench_http.dir/objects1.rsp
bin/bench_http.exe: CMakeFiles/bench_http.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin\bench_http.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\bench_http.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bench_http.dir/build: bin/bench_http.exe

.PHONY : CMakeFiles/bench_http.dir/build

CMakeFiles/bench_http.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\bench_http.dir\cmake_clean.cmake
.PHONY : CMakeFiles/bench_http.dir/clean

CMakeFiles/bench_http.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Cthulhu\Desktop\libevent C:\Users\Cthulhu\Desktop\libevent C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles\bench_http.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bench_http.dir/depend
