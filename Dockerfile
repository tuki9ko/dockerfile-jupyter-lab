FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=nointeractive
USER root

COPY ./requirements.txt /tmp
WORKDIR /code

RUN apt update && apt -y upgrade
RUN apt -y install curl python3 python3-distutils libgl1-mesa-dev libopencv-dev
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && rm -f get-pip.py

RUN pip install -r /tmp/requirements.txt

CMD jupyter-lab --nobrowser --allow-root --ip=* --NotebookApp.token=''
