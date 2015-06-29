#!/bin/sh

# Gustavo Luszczynski <gluszczy@redhat.com>

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# docker user
DOCKER_USER="luszczynski"

# Container Operation System
OS_CONTAINER="centos7"


function cleanup() {
	docker rmi $(docker images | grep "^<none>" | awk '{print $3}') 2>/dev/null
	docker rm $(docker ps -a | awk '{print $1}' | sed "1 d") 2>/dev/null
}


function startContainer() {
	cleanup 1> /dev/null

	CMD_START="docker run $1 -d --name $2 -v /etc/timezone:/etc/timezone:ro -v /tmp/share:/tmp/share";

	CMD_START="$CMD_START $DOCKER_USER/$3 $4"

	$CMD_START;
	
}

function stopContainer() {
	docker stop $1
	cleanup
}

function stopAll() {
	docker stop $(docker ps --filter 'status=running' | awk '{print $1}' | sed "1 d") 2>/dev/null
	cleanup
}

function statusContainer() {
	status=$(docker ps | grep $1 2> /dev/null)

	if [ "x$status" == "x" ]; then
		echo "Container is NOT running"
	else
		echo "Container is running"
	fi
}

function killContainer() {
	docker kill $1
	cleanup
}

function killAll() {
	docker kill $(docker ps --filter 'status=running' | awk '{print $1}' | sed "1 d") 2>/dev/null
	cleanup
}

function logContainer() {
	docker logs -f $1
}

function attachContainer() {
	docker exec -it $1 bash
}

function bashContainer() {
	docker run -ti $1 --rm --name $2 $DOCKER_USER/$3 /bin/bash
}

# $1 image name
# $2 path to Dockerfile
function buildImage() {
	#PARAM=$1

	#[[ $1 != $OS_CONTAINER* ]] || PARAM=$(echo $1 | cut -d "-" -f2,3,4,5)

	docker build --rm=true --force-rm=true -t $DOCKER_USER/$1 $2

	if [ "$?" == 0 ]; then
		cleanup
	fi
}

function ip() {
	docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1	
}

function removeAllImages() {
	docker rmi $(docker images | grep $DOCKER_USER | awk '{print $1}')
}

function usage() {
	  echo
	  echo "Usage: $0 ( start | stop | status | kill | log | attach | bash | build ) <image name> <instance name>"
	  echo "Usage: $0 ( stopall | killall | buildall | clean | removeimages )"
	  echo "============================================="
	  echo
	  echo "start 	<image name> <instance name>			start container"
	  echo "stop 	<instance name>					stop container"
	  echo "kill 	<instance name>					kill container"
	  echo "status 	<instance name>					show if container is running or not"
	  echo "log 	<instance name>					show container standard output"
	  echo "attach 	<instance name>					access container (similar to ssh)"
	  echo "bash 	<image name>					start container running /bin/bash"
	  echo "build 	<image name>					build container image"
	  echo "ip		<instancename>					get container ip"
	  echo
	  echo "<image name> is equal to Dockerfile's folder name."
	  echo "<instance name> is the name you give to your container."
	  echo "If none is set then instance name will be image name. Only some images accept random names (eap-host and jdg)"
	  echo 
	  echo "eg: 	$0 start eap-domain"
	  echo "	$0 log eap-domain"
	  echo "eg2: 	$0 start eap-host host01"
	  echo "	$0 attach host01"
	  echo "eg3: 	$0 start eap-host host02"
	  echo "	$0 kill host02"
	  echo
	  echo
	  echo "Usage: $0 ( stopall | killall | buildall | clean | removeimages )"
	  echo "=============================================="
	  echo
	  echo "stopall 					stop all containers"
	  echo "killall 					kill all containers"
	  echo "buildall 					build all images"
	  echo "clean 						remove stopped containers (docker ps -a)"
	  echo "removeimages 					remova all ${DOCKER_USER}'s images"
	  exit 0
}

if [ "$#" == 0 ] ; then
	usage
	exit 1
fi

# Path to container
CONTAINER_DIR=$(find . -maxdepth 3 -name "$2" | sed 's/.\///')

# Image name. It's the same name of the container dir
IMAGE_NAME=$(echo $CONTAINER_DIR | awk -F/ '{ print $NF }')
echo $IMAGE_NAME

# Instance name. Only used when image support multiples instances
INSTANCE_NAME=$(docker ps | grep "$2" | awk -F" " '{print $NF}')

case "$1" in
	start)
		startContainer "$CMD_LINE" $IMAGE_NAME $IMAGE_NAME
	;;
	stop)
		stopContainer $IMAGE_NAME
	;;
	resume)
		resume $IMAGE_NAME
	;;
	status)
		statusContainer $IMAGE_NAME
	;;
	kill)
		killContainer $IMAGE_NAME
	;;
	log)		
		logContainer $2
	;;
	attach)
		attachContainer $2
	;;
	bash)
		bashContainer "$CMD_LINE" $IMAGE_NAME $IMAGE_NAME
	;;
	build)
		buildImage $IMAGE_NAME $CONTAINER_DIR
	;;
	stopall)
		stopAll
	;;
	killall)
		killAll
	;;
	buildall)
		buildAll
	;;
	clean)
		cleanup
	;;
	removeimages)
		removeAllImages
	;;
	ip)
		ip $2
	;;
	--help)
		usage
	;;
	*)
		usage
esac
