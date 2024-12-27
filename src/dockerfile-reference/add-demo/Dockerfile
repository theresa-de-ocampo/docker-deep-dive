FROM alpine

WORKDIR /usr/dockerfile-reference

ADD ./movies.txt add-demo/
ADD ./resume-*.txt add-demo/

# Absolute Directory
ADD ./emergency.txt /usr/ 

# Remote Location
ADD https://raw.githubusercontent.com/theresa-de-ocampo/docker-deep-dive/3d503321f96173e00d5f91740f4af6efe4f4249e/src/linux-commands/grep-demo/welcome.txt add-demo/