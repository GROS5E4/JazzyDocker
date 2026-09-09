FROM ros:jazzy
SHELL ["/bin/bash", "-c"]

# -----------------------------
# Setup ROS environment in bashrc
# -----------------------------
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
RUN echo "if [ -f /ros2_ws/install/setup.bash ]; then source /ros2_ws/install/setup.bash; fi" >> ~/.bashrc

# -----------------------------
# Install dependencies
# -----------------------------
RUN apt-get -o Acquire::ForceIPv4=true update --fix-missing

RUN apt-get update && apt-get install -y \
    libasio-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update --fix-missing && \
    apt-get install -y git \
    nano \
    vim \
    tmux \
    python3-pip \
    python3-tk \
    python3-transforms3d \
    libeigen3-dev 

RUN apt-get install -y ros-jazzy-rviz2 \
    ros-jazzy-ackermann-msgs \
    ros-jazzy-nav-msgs \
    ros-jazzy-sensor-msgs \
    ros-jazzy-geometry-msgs \
    ros-jazzy-std-msgs \
    ros-jazzy-tf2 \
    ros-jazzy-tf2-ros \
    ros-jazzy-tf2-geometry-msgs \
    ros-jazzy-navigation2 \
    ros-jazzy-nav2-bringup \
    ros-jazzy-nav2-amcl \
    ros-jazzy-robot-localization \
    ros-jazzy-xacro \
    ros-jazzy-udp-msgs \
    ros-jazzy-teleop-twist-keyboard \
    ros-jazzy-joy-teleop \
    ros-jazzy-joy \
    ros-jazzy-joint-state-publisher \
    ros-jazzy-tf-transformations

RUN apt-get install -y x11-apps \
    x11-apps xterm \
    clang-format \
    openssh-client \
    iputils-ping \
    libnss-mdns



RUN echo "export RCUTILS_COLORIZED_OUTPUT=1 " >> ~/.bashrc

RUN echo -e "b() { \n    source /opt/ros/jazzy/setup.bash\n    cd /ros2_ws || exit \n   colcon build "$@" --symlink-install\n    source install/local_setup.bash\n   \n}" >> ~/.bashrc

# -----------------------------
# Setup entrypoint
# -----------------------------
ENTRYPOINT ["/ros2_ws/src/JazzyDocker/entrypoint.sh"]
CMD ["bash"]

