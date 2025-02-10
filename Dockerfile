FROM ubuntu:latest
RUN apt-get update
# RUN apt-get upgrade
RUN apt-get install build-essential python3 python3-venv python3-pip python3-tk curl make git
