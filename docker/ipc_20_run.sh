#!/usr/bin/env bash

ARGS=("$@")

# Make sure processes in the container can connect to the x server
# Necessary so gazebo can create a context for OpenGL rendering (even headless)
XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]; then
  xauth_list=$(xauth nlist $DISPLAY)
  xauth_list=$(sed -e 's/^..../ffff/' <<<"$xauth_list")
  if [ ! -z "$xauth_list" ]; then
    echo "$xauth_list" | xauth -f $XAUTH nmerge -
  else
    touch $XAUTH
  fi
  chmod a+r $XAUTH
fi

# Prevent executing "docker run" when xauth failed.
if [ ! -f $XAUTH ]; then
  echo "[$XAUTH] was not properly created. Exiting..."
  exit 1
fi

DOCKER_OPTS=

# Get the current version of docker-ce
# Strip leading stuff before the version number so it can be compared
DOCKER_VER=$(dpkg-query -f='${Version}' --show docker-ce | sed 's/[0-9]://')
if dpkg --compare-versions 19.03 gt "$DOCKER_VER"; then
  echo "Docker version is less than 19.03, using nvidia-docker2 runtime"
  if ! dpkg --list | grep nvidia-docker2; then
    echo "Please either update docker-ce to a version greater than 19.03 or install nvidia-docker2"
    exit 1
  fi
  DOCKER_OPTS="$DOCKER_OPTS --runtime=nvidia"
else
  echo "nvidia container toolkit"
  DOCKER_OPTS="$DOCKER_OPTS --gpus all"
fi

docker run -it \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY=$XAUTH \
  -v "$XAUTH:$XAUTH" \
  -v "/home/$USER/master_thesis:/home/kiat_thesis/master_thesis" \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/localtime:/etc/localtime:ro" \
  -v "/dev:/dev" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  --workdir "/home/kiat_thesis/master_thesis" \
  --user "root:root" \
  --name kiat_thesis \
  --network host \
  --rm \
  $DOCKER_OPTS \
  --privileged \
  --security-opt seccomp=unconfined \
  diabolokiat/kiat-thesis:laptop-ubuntu20.04 \
  bash