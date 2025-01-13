prereqs:
install docker

to build a local image, run `docker build -t python-fastapi-server:1.0 .`

to run the image in a container, run `docker run -d -p 8000:8000 python-fastapi-server:1.0`
