# Modifying your .bashrc
The *.bashrc* file is a **shell configuration file**. Everytime you open a terminal, a bash session starts, executing the *.bashrc*. You'll need to add a couple of macros and functions in your .bahsrc to work efficiently.

- Open the .bashrc with the gedit editor (simplest editor)
```bash
gedit ~/.bashrc
```
- At the top of the file, copy:
```
# Additions
alias racecar-build='xhost +local:docker && cd ~/ros2_ws/src/JazzyDocker && docker compose build'
alias racecar-up='cd ~/ros2_ws/src/JazzyDocker && docker compose up -d && xhost +local:docker'
alias racecar-down='cd ~/ros2_ws/src/JazzyDocker && docker compose down'
alias racecar-bash='docker exec -it racecar bash'
alias racecar-nuke='docker system prune -a --volumes'
alias racecar-space='docker system df'
alias racecar-list='docker ps'
```
- Here's an important overview of what each macros and function mean:
1. *racecar-build* : this command will build the *racecar* docker container.
2. *racecar-up* : this command starts the *racecar* docker.
3. *racecar-down* : this command stops the *racecar* docker.
4. *racecar-bash* : this command allows you to start a bash session in the docker container. In other words, the docker container is isolated from your host machine. Therefore, you can't access or do anything in the container from your host terminal... You need to open the docker's terminal, with racecar-bash.
5. *racecar-space* : this will give you a summary of the space being taken on your host machine by the docker images.
6. *racecar-nuke* : this command destroys every docker image. It can be pretty useful if you have plenty of docker images on your host machine taking a lot of space (check using racecar-space)
7. *racecar-list* : this command will give you the list of the dockers running on your host machine.
8. b : this function handles the building of all the ROS2 packages using *colcon build*. **IMPORTANT: You can run it from anywhere on your docker terminal. Meaning you can't use the 'b' command from your host machine.**
