FROM debian:latest
MAINTAINER dorey415@gmail.com

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq python-dev libxml2 libxml2-dev libxslt-dev lib32z1-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq python-pip
RUN apt-get clean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq default-jdk

WORKDIR /app
ADD ./requirements.pip /app/requirements.pip
RUN pip install -r requirements.pip
ADD . /app
