FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential python3 python3-venv python3-pip python3-tk curl make git
CMD ["echo", "Welcome to ASIC Design with Docker"]
