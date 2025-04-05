# [ARG, ENV, and .env](https://vsupalov.com/docker-arg-env-variable-guide/)

## The Dot Env File (.env)

Some tools like Docker Compose look into it by default if it is in the current directory. If you have a file named `.env` in your project, it's only used to put values into the active `compose.yaml`. This mechanism has not set any `ENV` or `ARG` values in Docker by itself. It's exclusively a Docker Compose thing.

The key-value pairs in your `.env` are used to substitute dollar-notation variables in the `compose.yaml` file.

```yaml
version: "1"

services:
  web-fe:
    image: ubuntu
    environment:
      - NODE_ENV=${NODE_ENV}
```

> HINT. When working with a `.env` file, you can debug your `compose.yaml` with a single command. Type `docker compose config`. This way you'll see how the `compose.yaml` file content looks like after the substitution step without running anything else.

## ARG

Variables defined through `ARG` are also known as build-time variables. They are only available from the moment they are _announced_ in the Dockerfile.

Running containers **can't** access the values of `ARG` variables. So anything you run via `CMD` and `ENTRYPOINT` instructions won't see those values.

Even though `ARG` values are not available to the container, they can easily be inspected through the Docker CLI after an image is built. For example by running `docker history` on an image. `ARG` and `ENV` are a poor choice for sensitive data if untrusted users have access to your images.

### Setting ARG values

When building a Docker image from the command line, you can set the `ARG` values using `--build-arg`.

```bash
docker build -t arg-demo:latest --build-arg nickname=Teriz -f arg.Dockerfile .
```

Notice that it will output the following during build.

```bash
 => [2/2] RUN echo "Hi Teriz"
```

What if you build your images via Docker Compose? When using `docker compose`, you can specify `args` to pass to the Dockerfile `ARG` entries.

```yaml
version: "2"

services:
  web-fe:
    build:
      context: .
      dockerfile: Dockerfile
      args:
        nickname: Teriz
```

When you try to set a variable which is not `ARG` mentioned in the Dockerfile, Docker will complain.

```bash
services.web-fe.build.args.[0]: unexpected type map[string]interface {}
```

## ENV

`ENV` variables are available both during the build and to the future running container.

### Setting ENV Values

- You can set `ENV` values during the build, see [env.Dockerfile](./env.Dockerfile)
- You can set `ENV` values when running containers in various ways.

> NOTE. You can pass environment variables which are not defined via `ENV`. Build-time `ARG` variables are more strict about needing to be defined.

When operating via the command line, use the `-e` flag.

```bash
docker run -e NODE_ENV=staging env-demo:v2
```

Instead of listing a lot of variables, we can specify a file where they are written down. Note that this will not work if you've included `.env` in `.dockerignore`.

```bash
docker run --env-file .env env-demo:v2
```

With `compose.yaml` file, we use the `env_file` instruction.

```yaml
version: "3"

services:
  web-fe:
    image: ubuntu
    env_file: .env
```

> HINT. `docker inspect image` has an `ENV` array that will let you know the default `ENV` variable values before the container is started.
