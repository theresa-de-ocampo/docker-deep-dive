FROM ubuntu

# bash doesn't forward CTRL+C SIGINT to top
ENTRYPOINT top -b