# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
CMAKE_COMMAND = /snap/clion/138/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/138/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sab3r/ws/src/algo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sab3r/ws/src/algo/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/server.dir/flags.make

CMakeFiles/server.dir/src/server.cpp.o: CMakeFiles/server.dir/flags.make
CMakeFiles/server.dir/src/server.cpp.o: ../src/server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sab3r/ws/src/algo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/server.dir/src/server.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server.dir/src/server.cpp.o -c /home/sab3r/ws/src/algo/src/server.cpp

CMakeFiles/server.dir/src/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/src/server.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sab3r/ws/src/algo/src/server.cpp > CMakeFiles/server.dir/src/server.cpp.i

CMakeFiles/server.dir/src/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/src/server.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sab3r/ws/src/algo/src/server.cpp -o CMakeFiles/server.dir/src/server.cpp.s

# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/src/server.cpp.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

devel/lib/algo/server: CMakeFiles/server.dir/src/server.cpp.o
devel/lib/algo/server: CMakeFiles/server.dir/build.make
devel/lib/algo/server: /opt/ros/melodic/lib/libtf.so
devel/lib/algo/server: /opt/ros/melodic/lib/libtf2_ros.so
devel/lib/algo/server: /opt/ros/melodic/lib/libactionlib.so
devel/lib/algo/server: /opt/ros/melodic/lib/libmessage_filters.so
devel/lib/algo/server: /opt/ros/melodic/lib/libroscpp.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
devel/lib/algo/server: /opt/ros/melodic/lib/libxmlrpcpp.so
devel/lib/algo/server: /opt/ros/melodic/lib/libtf2.so
devel/lib/algo/server: /opt/ros/melodic/lib/librosconsole.so
devel/lib/algo/server: /opt/ros/melodic/lib/librosconsole_log4cxx.so
devel/lib/algo/server: /opt/ros/melodic/lib/librosconsole_backend_interface.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libboost_regex.so
devel/lib/algo/server: /opt/ros/melodic/lib/libroscpp_serialization.so
devel/lib/algo/server: /opt/ros/melodic/lib/librostime.so
devel/lib/algo/server: /opt/ros/melodic/lib/libcpp_common.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libboost_system.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libboost_thread.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libpthread.so
devel/lib/algo/server: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
devel/lib/algo/server: CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sab3r/ws/src/algo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable devel/lib/algo/server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/server.dir/build: devel/lib/algo/server

.PHONY : CMakeFiles/server.dir/build

CMakeFiles/server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/server.dir/clean

CMakeFiles/server.dir/depend:
	cd /home/sab3r/ws/src/algo/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sab3r/ws/src/algo /home/sab3r/ws/src/algo /home/sab3r/ws/src/algo/cmake-build-debug /home/sab3r/ws/src/algo/cmake-build-debug /home/sab3r/ws/src/algo/cmake-build-debug/CMakeFiles/server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/server.dir/depend

