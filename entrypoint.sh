#!/bin/bash
# entrypoint.sh

# Source ROS setup
source /opt/ros/jazzy/setup.bash
source /ros2_ws/install/setup.bash

# Keep container alive with bash
exec "$@"