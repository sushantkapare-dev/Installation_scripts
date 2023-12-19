#!/bin/bash

# Define variables
SCOUT_SUITE_VERSION="5.8.1"  # Replace with the desired version

# Pull Scout Suite Docker image
docker pull nccgroup/scoutsuite:${SCOUT_SUITE_VERSION}

# Alias for simplified execution
echo "alias scoutsuite='docker run -it --rm -v \$(pwd):/scout/results nccgroup/scoutsuite:${SCOUT_SUITE_VERSION}'" >> ~/.bashrc
source ~/.bashrc

# Display installation success message
echo "Scout Suite ${SCOUT_SUITE_VERSION} has been installed. Use 'scoutsuite' command to run it."
