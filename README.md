# rpi-kibana

[![Build Status](https://travis-ci.org/sofwerx/rpi-kibana.svg)](https://travis-ci.org/sofwerx/rpi-kibana)
[![Docker Hub Image Layers](https://images.microbadger.com/badges/image/sofwerx/rpi-kibana.svg)](https://hub.docker.com/r/sofwerx/rpi-kibana)
[![Docker Hub Image Version](https://images.microbadger.com/badges/version/sofwerx/rpi-kibana.svg)](https://hub.docker.com/r/sofwerx/rpi-kibana)

This is the Dockerfile behind `sofwerx/rpi-kibana:latest` on Docker Hub, setup to autobuild through travis.

Note: the base image of the Dockerfile is `FROM multiarch/debian-debootstrap:armhf-jessie`, which is to allow the x86_64 travis-ci servers to run qemu when building the ARM contents of this resultant image.

This runs a Kibana service.

The parent project to this is [sofwerx/rpi-tpms](https://github.com/sofwerx/rpi-tpms). There you will find the docker-compose that uses this container.

Here is the docker-compose snippet of this container image in use:

  kibana:
    image: sofwerx/rpi-kibana:latest
    container_name: kibana
    hostname: kibana
    restart: always
    links:
      - "elasticsearch:elasticsearch"
    ports:
      - "5601:5601"
    depends_on:
      - multiarch
      - elasticsearch
    logging:
      driver: json-file
      options:
        max-size: "20k"

