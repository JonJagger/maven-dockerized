# - - - - - - - - - - - - - - - - - - - - - - - - -
# Edit these four env-vars
# - - - - - - - - - - - - - - - - - - - - - - - - -
# The value of the artifactId tag from your pom.xml
# Mine looks like this <artifactId>demowebmvc</artifactId>
export POM_ARTIFACT_ID=demowebmvc

# The value of the version tag from your pom.xml
# Mine looks like this <version>0.0.1-SNAPSHOT</version>
export POM_VERSION=0.0.1-SNAPSHOT

# Your project name.
# Use only a-z 0-9 hyphen
export PROJECT_NAME=project-alpha

# The port your apps runs on.
# Edit this to the same value you are using in your
# application.properties file
export APP_PORT=9082


# - - - - - - - - - - - - - - - - - - - - - - - - -
# This env-var controls how the docker image created
# in the TeamCity build step #1 gets copied to the
# deployment machine in TeamCity build step #3.
# Choose true if the dockerreg registry is working.
# Choose false if it is not - it's disk fills up
# fairly often because it has a disk which is too
# small for all the sites.
# - - - - - - - - - - - - - - - - - - - - - - - - -
#export USE_REGISTRY=true
export USE_REGISTRY=false


# - - - - - - - - - - - - - - - - - - - - - - - - -
# The following env-vars should not need to be edited.
# - - - - - - - - - - - - - - - - - - - - - - - - -
# The jar filename created in target/ by maven/eclipse
export JAR_FILENAME=${POM_ARTIFACT_ID}-${POM_VERSION}.jar

# The name of the docker image which contains the jar file.
export APP_IMAGE=${PROJECT_NAME}

# The name of the docker container created from the docker image.
export APP_CONTAINER=${PROJECT_NAME}

# The name of the docker image registry.
# Like a source code repository but for images.
export DOCKER_REGISTRY_URL=dockerreg.training.local:5000
