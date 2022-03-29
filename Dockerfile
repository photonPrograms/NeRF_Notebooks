# will have to change to the appropriate image 
# to use other versions of CUDA
FROM nvidia/cuda:11.5.1-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

# use/modify if apt-get uses a proxy
# such as a university proxy
ENV http_proxy '<your_proxy>'
ENV https_proxy '<your_proxy>'
RUN apt-get update && \
    apt-get -y install build-essential git python3-dev python3-pip \
        libopenexr-dev libxi-dev libglfw3-dev libglew-dev libomp-dev \
        mesa-utils libgl1-mesa-glx \
        libxinerama-dev libxcursor-dev && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}" \
    PIP_NO_CACHE_DIR="1"

ENV NVIDIA_DRIVER_CAPABILITIES compute,utility,display

RUN pip3 install --upgrade cmake
RUN git clone --recursive https://github.com/nvlabs/instant-ngp

WORKDIR instant-ngp

# list of common architectures and corresponding codes
# available on instant-ngp github
ENV TCNN_CUDA_ARCHITECTURES=70
 
RUN pip3 install -r requirements.txt && \
    # add -DNGP_BUILD_WITH_GUI=OFF if you want to disable the GUI
    cmake . -B build -DNGP_BUILD_WITH_GUI=OFF && \
    cmake --build build --config RelWithDebInfo -j `nproc`

CMD ["/usr/bin/bash"]
