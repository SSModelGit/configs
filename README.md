# configs
Personal configuration files for Ubuntu systems (mainly Ubuntu-based Docker containers)

- When running a setup file, ex. `configs/commonSetup/volume-setup.bash`, change into the directory of the setup file first.
- There are currently four setup styles:
  - A standard setup, denoted as commonSetup
  - A Python-based setup, pythonSetup
  - A Java setup, javaSetup
  - A ROS Kinetic setup, roskineticSetup
- Each one of the setups contain two scripts, `package-setup.sh` and `volume-setup.sh`.
  - Each time a Docker container is (re)initialized, it starts from scratch, without any additional packages installed, beyond those that come with the container's corresponding image
  - However, volumes persist, and can be mounted to different containers. If the file changes are done within the volume, then each container that mounts the volume will also receive those corresponding file changes.
  - Hence, the two scripts are created:
	- When initializing a container, but with a persisting volume, simply `cd` into the corresponding setup folder, and run `bash package-setup.sh`.
	- When initializing a volume for the first time, create a new container, and mount the new volume. Then, `cd` into the corresponding setup folder, and run `bash volume-setup.sh`.
	  - `volume-setup.sh` automatically runs `package-setup.sh` at the start of the script.
  - As a side tip, it is convenient to set the $HOME env variable within a container to the volume's mount point, so that the home directory and its corresponding files are entirely within the volume, and therefore persistent.
