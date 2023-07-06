# Choose a base image
FROM debian:9.5-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl jq

# Copy your script into the Docker image
ADD entrypoint.sh /entrypoint.sh

# Make your script executable
RUN chmod +x /entrypoint.sh

# Specify the script to run when the Docker container starts
ENTRYPOINT ["/entrypoint.sh"]
