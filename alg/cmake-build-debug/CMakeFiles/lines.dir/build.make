# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/saber/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/193.6494.38/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/saber/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/193.6494.38/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/saber/new_ws/src/alg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/saber/new_ws/src/alg/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/lines.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lines.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lines.dir/flags.make

CMakeFiles/lines.dir/src/lines.cpp.o: CMakeFiles/lines.dir/flags.make
CMakeFiles/lines.dir/src/lines.cpp.o: ../src/lines.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/saber/new_ws/src/alg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/lines.dir/src/lines.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lines.dir/src/lines.cpp.o -c /home/saber/new_ws/src/alg/src/lines.cpp

CMakeFiles/lines.dir/src/lines.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lines.dir/src/lines.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/saber/new_ws/src/alg/src/lines.cpp > CMakeFiles/lines.dir/src/lines.cpp.i

CMakeFiles/lines.dir/src/lines.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lines.dir/src/lines.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/saber/new_ws/src/alg/src/lines.cpp -o CMakeFiles/lines.dir/src/lines.cpp.s

# Object files for target lines
lines_OBJECTS = \
"CMakeFiles/lines.dir/src/lines.cpp.o"

# External object files for target lines
lines_EXTERNAL_OBJECTS =

devel/lib/alg/lines: CMakeFiles/lines.dir/src/lines.cpp.o
devel/lib/alg/lines: CMakeFiles/lines.dir/build.make
devel/lib/alg/lines: /opt/ros/melodic/lib/libtf.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libtf2_ros.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libactionlib.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libmessage_filters.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libroscpp.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_signals.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libxmlrpcpp.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libtf2.so
devel/lib/alg/lines: /opt/ros/melodic/lib/librosconsole.so
devel/lib/alg/lines: /opt/ros/melodic/lib/librosconsole_log4cxx.so
devel/lib/alg/lines: /opt/ros/melodic/lib/librosconsole_backend_interface.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_regex.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libroscpp_serialization.so
devel/lib/alg/lines: /opt/ros/melodic/lib/librostime.so
devel/lib/alg/lines: /opt/ros/melodic/lib/libcpp_common.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_system.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_thread.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libpthread.so
devel/lib/alg/lines: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
devel/lib/alg/lines: CMakeFiles/lines.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/saber/new_ws/src/alg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable devel/lib/alg/lines"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lines.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lines.dir/build: devel/lib/alg/lines

.PHONY : CMakeFiles/lines.dir/build

CMakeFiles/lines.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lines.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lines.dir/clean

CMakeFiles/lines.dir/depend:
	cd /home/saber/new_ws/src/alg/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/saber/new_ws/src/alg /home/saber/new_ws/src/alg /home/saber/new_ws/src/alg/cmake-build-debug /home/saber/new_ws/src/alg/cmake-build-debug /home/saber/new_ws/src/alg/cmake-build-debug/CMakeFiles/lines.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lines.dir/depend
