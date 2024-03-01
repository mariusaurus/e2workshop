FROM nvcr.io/nvidia/modulus/modulus:24.01
WORKDIR /opt
RUN git clone https://github.com/NVIDIA/earth2mip
WORKDIR /opt/earth2mip
RUN pip install .

# # just to be sure, install the latest modulus version
# COPY ./modulus /opt/modulus
# WORKDIR /opt/modulus
# RUN pip install .
