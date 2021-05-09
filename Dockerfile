FROM python:slim-buster
RUN apt-get -y update
RUN apt-get -y install git 
RUN apt-get -y install curl 

RUN apt-get -y install unzip

RUN git clone https://github.com/flutter/flutter.git -b stable
ENV PATH="/flutter/bin:${PATH}"
RUN flutter doctor
EXPOSE 80
CMD ["bash"]
# docker build -t flutter_image:latest . --load
