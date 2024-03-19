FROM nvcr.io/nvidia/modulus/modulus:24.01

# update
RUN apt-get -y update
RUN apt -y install ffmpeg
RUN pip install --no-input --upgrade pip

# get and install latest modulus
WORKDIR /opt
RUN git clone https://github.com/NVIDIA/modulus.git
WORKDIR /opt/modulus
RUN pip install --no-input .

# get and install E2MIP
WORKDIR /opt
RUN git clone https://github.com/NVIDIA/earth2mip
WORKDIR /opt/earth2mip
RUN pip install --no-input .
RUN pip install cartopy babel

WORKDIR /e2ws