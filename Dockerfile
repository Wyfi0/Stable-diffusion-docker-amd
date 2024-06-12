FROM rocm/rocm-terminal:latest

SHELL ["/bin/bash", "-c"]

USER root

# Move to home/LLM/
WORKDIR /home
RUN mkdir LLM
WORKDIR /home/LLM

RUN apt-get update
RUN apt-get install -y wget git python bash

# Idk but this is needed
RUN pip3 install networkx==3.1

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.0

WORKDIR /home/LLM

RUN git clone https://github.com/comfyanonymous/ComfyUI.git && cd ComfyUI \
    && pip3 install -r requirements.txt 

WORKDIR /home/LLM

ENTRYPOINT cd / && find / ComfyUI && ls && pwd && python3 main.py --listen 
