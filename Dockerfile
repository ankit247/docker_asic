FROM ubuntu:24.04
RUN rm -rf /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential python3 python3-venv python3-pip python3-tk curl make cmake git vim

RUN mkdir -p ~/workspace/repo && cd ~/workspace/repo
RUN cd ~/workspace/ && curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && yes | ./cs setup
#RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
#ls -l ~/.local/share/coursier/bin 
RUN source ~/.bashrc && echo $PATH

#mnemosyne installation
RUN apt-get install -y pkg-config libboost-all-dev libxml++2.6-dev glpk-utils libglpk-dev
RUN cd ~/workspace/repo && git clone https://github.com/chrpilat/mnemosyne
RUN mkdir ~/workspace/repo/mnemosyne/build && cd ~/workspace/repo/mnemosyne/build && cmake ../. -DCMAKE_INSTALL_PREFIX=/opt/mnemosyne && make && make install
RUN cd /tmp && /opt/mnemosyne/bin/mnemosyne --help

#Dynamatic installation
RUN apt-get install -y clang lld ccache cmake ninja-build python3 openjdk-21-jdk graphviz libboost-regex-dev git curl gzip libreadline-dev
#RUN apt-get install -y scala
#RUN cd ~/workspace/ && curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
RUN cd ~/workspace/repo && git clone --recurse-submodules https://github.com/EPFL-LAP/dynamatic.git
RUN cd ~/workspace/repo/dynamatic && chmod +x ./build.sh && ./build.sh --release --threads 4 --llvm-parallel-link-jobs 4
RUN cd ~/workspace/repo/dynamatic/build && ninja check-dynamatic

CMD ["echo", "Welcome to ASIC Design with Docker"]
