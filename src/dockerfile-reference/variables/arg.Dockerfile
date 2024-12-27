FROM ubuntu

# No default value
ARG nickname

# Outputs argument during build
RUN echo "Hi ${nickname}"

# Outputs literal ${nickname} string
ENTRYPOINT [ "echo", "Hi ${nickname}" ]