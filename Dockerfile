FROM ubuntu:24.04
RUN rm -rf /bin/sh && ln -s /bin/bash /bin/sh && echo $0
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential python3 python3-venv python3-pip python3-tk curl make cmake git

RUN mkdir -p ~/workspace/repo && cd ~/workspace/repo && pwd && ls

#mnemosyne installation
RUN git clone https://github.com/chrpilat/mnemosyne && ls && cd mnemosyne
RUN pwd && ls && mkdir build && cd build
RUN which cmake && cmake ../. -DCMAKE_INSTALL_PREFIX=/opt/mnemosyne
RUN make && make install
RUN cd /temp && mnemosyne --help

#Dynamatic installation
#RUN apt-get install -y clang lld ccache cmake ninja-build python3 openjdk-21-jdk graphviz libboost-regex-dev git curl gzip libreadline-dev
#RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
#RUN git clone --recurse-submodules https://github.com/EPFL-LAP/dynamatic.git
#RUN chmod +x ./dynamatic/build.sh
#RUN ./dynamatic/build.sh --release

CMD ["echo", "Welcome to ASIC Design with Docker"]
