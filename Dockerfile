#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
# Use a base image with the necessary compilers and tools
FROM ubuntu:latest

# Install build dependencies for OpenMS
RUN apt-get update && apt-get install -y \
  build-essential \
  cmake \
  qtbase5-dev \
  libqt5svg5-dev \
  qttools5-dev \
  libeigen3-dev \
  libhdf5-dev \

RUN git clone https://github.com/OpenMS/OpenMS.git

RUN git submodule update --init contrib
RUN cd OpenMS
RUN git submodule update --init contrib
RUN cd ..
RUN mkdir contrib-build
RUN cd contrib-build
RUN cmake -DBUILD_TYPE=LIST ../OpenMS/contrib
RUN cmake -DBUILD_TYPE=EIGEN ../OpenMS/contrib
RUN cmake -DBUILD_TYPE=ALL -DNUMBER_OF_JOBS=4 ../OpenMS/contrib
RUN cmake -DBUILD_TYPE=LIST ../OpenMS/contrib
RUN cmake -DBUILD_TYPE=ALL -DNUMBER_OF_JOBS=4 ../OpenMS/contrib
RUN cd ..
RUN mkdir OpenMS-build
RUN cd OpenMS-build
COPY main.cpp /app/


RUN g++ -o /app/Healthcheck /app/main.cpp `pkg-config --cflags --libs OpenMS`

WORKDIR /app

COPY app.py /app/
RUN pip install flask
EXPOSE 5000

CMD ["python", "app.py"]
