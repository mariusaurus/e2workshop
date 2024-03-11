FROM nvcr.io/nvidia/modulus/modulus:24.01
WORKDIR /opt
RUN apt-get -y update
RUN apt -y install ffmpeg
RUN git clone https://github.com/NVIDIA/earth2mip
WORKDIR /opt/earth2mip
RUN pip install .
RUN pip install cartopy babel

# # just to be sure, install the latest modulus version
# COPY ./modulus /opt/modulus
# WORKDIR /opt/modulus
# RUN pip install .
