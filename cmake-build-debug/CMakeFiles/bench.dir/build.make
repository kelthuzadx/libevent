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
include CMakeFiles/bench.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bench.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bench.dir/flags.make

CMakeFiles/bench.dir/test/bench.c.obj: CMakeFiles/bench.dir/flags.make
CMakeFiles/bench.dir/test/bench.c.obj: CMakeFiles/bench.dir/includes_C.rsp
CMakeFiles/bench.dir/test/bench.c.obj: ../test/bench.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/bench.dir/test/bench.c.obj"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\bench.dir\test\bench.c.obj   -c C:\Users\Cthulhu\Desktop\libevent\test\bench.c

CMakeFiles/bench.dir/test/bench.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bench.dir/test/bench.c.i"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Cthulhu\Desktop\libevent\test\bench.c > CMakeFiles\bench.dir\test\bench.c.i

CMakeFiles/bench.dir/test/bench.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bench.dir/test/bench.c.s"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\Cthulhu\Desktop\libevent\test\bench.c -o CMakeFiles\bench.dir\test\bench.c.s

CMakeFiles/bench.dir/WIN32-Code/getopt.c.obj: CMakeFiles/bench.dir/flags.make
CMakeFiles/bench.dir/WIN32-Code/getopt.c.obj: CMakeFiles/bench.dir/includes_C.rsp
CMakeFiles/bench.dir/WIN32-Code/getopt.c.obj: ../WIN32-Code/getopt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/bench.dir/WIN32-Code/getopt.c.obj"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\bench.dir\WIN32-Code\getopt.c.obj   -c C:\Users\Cthulhu\Desktop\libevent\WIN32-Code\getopt.c

CMakeFiles/bench.dir/WIN32-Code/getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bench.dir/WIN32-Code/getopt.c.i"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Cthulhu\Desktop\libevent\WIN32-Code\getopt.c > CMakeFiles\bench.dir\WIN32-Code\getopt.c.i

CMakeFiles/bench.dir/WIN32-Code/getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bench.dir/WIN32-Code/getopt.c.s"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\Cthulhu\Desktop\libevent\WIN32-Code\getopt.c -o CMakeFiles\bench.dir\WIN32-Code\getopt.c.s

CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.obj: CMakeFiles/bench.dir/flags.make
CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.obj: CMakeFiles/bench.dir/includes_C.rsp
CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.obj: ../WIN32-Code/getopt_long.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.obj"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\bench.dir\WIN32-Code\getopt_long.c.obj   -c C:\Users\Cthulhu\Desktop\libevent\WIN32-Code\getopt_long.c

CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.i"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Cthulhu\Desktop\libevent\WIN32-Code\getopt_long.c > CMakeFiles\bench.dir\WIN32-Code\getopt_long.c.i

CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.s"
	"F:\Program Files\mingw-w64\x86_64-7.1.0-posix-seh-rt_v5-rev2\mingw64\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\Cthulhu\Desktop\libevent\WIN32-Code\getopt_long.c -o CMakeFiles\bench.dir\WIN32-Code\getopt_long.c.s

# Object files for target bench
bench_OBJECTS = \
"CMakeFiles/bench.dir/test/bench.c.obj" \
"CMakeFiles/bench.dir/WIN32-Code/getopt.c.obj" \
"CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.obj"

# External object files for target bench
bench_EXTERNAL_OBJECTS =

bin/bench.exe: CMakeFiles/bench.dir/test/bench.c.obj
bin/bench.exe: CMakeFiles/bench.dir/WIN32-Code/getopt.c.obj
bin/bench.exe: CMakeFiles/bench.dir/WIN32-Code/getopt_long.c.obj
bin/bench.exe: CMakeFiles/bench.dir/build.make
bin/bench.exe: lib/libevent_extra.a
bin/bench.exe: lib/libevent_core.a
bin/bench.exe: CMakeFiles/bench.dir/linklibs.rsp
bin/bench.exe: CMakeFiles/bench.dir/objects1.rsp
bin/bench.exe: CMakeFiles/bench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable bin\bench.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\bench.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bench.dir/build: bin/bench.exe

.PHONY : CMakeFiles/bench.dir/build

CMakeFiles/bench.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\bench.dir\cmake_clean.cmake
.PHONY : CMakeFiles/bench.dir/clean

CMakeFiles/bench.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Cthulhu\Desktop\libevent C:\Users\Cthulhu\Desktop\libevent C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug C:\Users\Cthulhu\Desktop\libevent\cmake-build-debug\CMakeFiles\bench.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bench.dir/depend
