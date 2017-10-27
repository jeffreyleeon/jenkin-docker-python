# Use an official Python runtime as a parent image
FROM ubuntu:16.04
FROM python:2.7-slim

# Set the working directory
WORKDIR /home/automation/zbat

# Copy the current directory contents into the container at /app
ADD . /home/automation/zbat

RUN apt-get -y update

# Install text editor
RUN apt-get -y install vim

# Install chromium
RUN apt-get -y install build-essential libssl-dev php5-mcrypt python-setuptools libffi-dev
RUN easy_install pip
RUN easy_install -U pip

RUN mkdir -p /logs/selenium

RUN cat requirements.txt | xargs -n 1 -L 1 pip install; exit 0

