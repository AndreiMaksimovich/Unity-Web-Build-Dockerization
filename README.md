# Unity-Web-Build-Dockerization

Example Dockerfiles and configs for hosting Unity WebGL builds in an nginx-based Docker container

# Nginx Configuration

Out of the box, Nginx won’t correctly serve WebAssembly (.wasm) files that are compressed with Brotli or Gzip. This custom Nginx configuration knows how to handle these files and deliver them to the browser properly.

./nginx/default.conf.template

# Docker File ./Dockerfile

Dockerfile builds an image based on the latest Nginx image release. It copies the contents of the build folder into the container and uses our custom Nginx template as the default site configuration.

# DockerCompose File ./DockerCompose.yaml

Docker Compose file builds an image and container named unity_project_name from our Dockerfile, and maps the container’s output to port 80.

# Helper Scripts

Note: The scripts are created for macOS, but they should run without issues on Linux.

**./Run.sh**

Script useful for local testing that runs the container and automatically removes it once it stops.

**./Start.sh:**

Script that launches the container.

# How to Use

Just place your Unity WebGL build into the ./build folder, then run the provided scripts or use Docker manually.

# What Next

This is a minimal example, suitable for testing purposes only. In a real project, you would typically set up a CI/CD pipeline to:
* Build separate images for testing, review, and production, or/and system for image promotion.
* Implement proper image versioning.
* Automate pushing images to container repositories.
* Automate image and container updates in Kubernetes clusters, including graceful user drainage.
