# Install script for directory: /home/ando/catkin_ws/src/rosbook_pkgs/chapter11/pluginlib_arrayutil_client

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ando/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "”Release”")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ando/catkin_ws/build/rosbook_pkgs/chapter11/pluginlib_arrayutil_client/catkin_generated/installspace/pluginlib_arrayutil_client.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pluginlib_arrayutil_client/cmake" TYPE FILE FILES
    "/home/ando/catkin_ws/build/rosbook_pkgs/chapter11/pluginlib_arrayutil_client/catkin_generated/installspace/pluginlib_arrayutil_clientConfig.cmake"
    "/home/ando/catkin_ws/build/rosbook_pkgs/chapter11/pluginlib_arrayutil_client/catkin_generated/installspace/pluginlib_arrayutil_clientConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pluginlib_arrayutil_client" TYPE FILE FILES "/home/ando/catkin_ws/src/rosbook_pkgs/chapter11/pluginlib_arrayutil_client/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pluginlib_arrayutil_client/launch" TYPE DIRECTORY FILES "/home/ando/catkin_ws/src/rosbook_pkgs/chapter11/pluginlib_arrayutil_client/launch/")
endif()
