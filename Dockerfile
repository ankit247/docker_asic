FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential python3 python3-venv python3-pip python3-tk curl make git

#Dynamatic installation
#RUN apt-get install -y clang lld ccache cmake ninja-build python3 openjdk-21-jdk graphviz libboost-regex-dev git curl gzip libreadline-dev
#RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
#RUN git clone --recurse-submodules https://github.com/EPFL-LAP/dynamatic.git
#RUN chmod +x ./dynamatic/build.sh
#RUN ./dynamatic/build.sh --release

CMD ["echo", "Welcome to ASIC Design with Docker"]
