FROM --platform=linux/amd64 debian:bullseye

ENV PICO_SDK_TAG="1.5.0" \
    PIMORONI_PICO_TAG="v1.19.17" \
    PICO_SDK_PATH="/opt/pico-sdk" \
    PIMORONI_PICO_PATH="/opt/pimoroni-pico" \
    DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y cmake build-essential git python3 \
    && apt install -y gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib

RUN git clone --recurse-submodules https://github.com/raspberrypi/pico-sdk.git $PICO_SDK_PATH \
    && cd $PICO_SDK_PATH \
    && git checkout $PICO_SDK_TAG

RUN git clone https://github.com/pimoroni/pimoroni-pico.git $PIMORONI_PICO_PATH \
    && cd $PIMORONI_PICO_PATH \
    && git checkout $PIMORONI_PICO_TAG
