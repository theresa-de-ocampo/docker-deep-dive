FROM ubuntu

# top traps CTRL+C SIGINT and stops
ENTRYPOINT [ "top", "-b" ]