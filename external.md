# Notes

## `docker run` vs `docker exec` vs. `docker start`

- `docker run` command creates and starts a new container from an image.
- `docker exec` command interacts with an already running container.
- `docker start` starts a stopped container.
- Moreover, `docker exec` has no relationship with the `ENTRYPOINT` or `CMD` of Dockerfile. The `docker exec` command runs a new command in a running container. Just a command, any command, they never reference the `ENTRYPOINT` or the `CMD`.
