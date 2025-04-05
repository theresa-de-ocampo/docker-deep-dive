# `CMD` vs `ENTRYPOINT` Instructions

From [Abhinav Dubey's blog post](https://devtron.ai/blog/cmd-and-entrypoint-differences/).

Both instructions are used to specify the programs/commands to execute while initializing a container from a Docker image.

- `CMD` commands are ignored by daemon when there are parameters stated in the `docker run` command
- `ENTRYPOINT` instructions are not ignored, but instead are appended as command line parameters by treating those as arguments of the command.

## `CMD`

Sets the default command.

There can only be one `CMD` instruction in a Dockerfile. If you list more than one `CMD`, only the last one takes effect.

Go to [playground](./cmd.Dockerfile).

```bash
$ docker build -t hands-on:v2 -f cmd.Dockerfile .

$ docker run hands-on:v2
My name is Teriz

$ docker run hands-on:v2 echo "Hi, I am Teriz"
Hi, I am Teriz

$ docker run hands-on:v2 printenv
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=d16c7ca2c226
HOME=/root
```

## `ENTRYPOINT`

Sets the default executable.
By opting for this instruction method, you imply that the container is specifically built for certain use-cases where command should not be overridden.

```bash
$ docker build -t hands-on:v3 -f entrypoint.Dockerfile .

$ docker run hands-on:v3
My name is Teriz

$ docker run hands-on:v3 De Ocampo
My name is Teriz De Ocampo

$ docker run hands-on:v3 printenv
My name is Teriz printenv
```

The default nature of `ENTRYPOINT` in Dockerfile is not to be overriden by parameters passed in command, but with some explicit docker flags, it can be overrided.

```bash
$ docker run --entrypoint printenv hands-on:v3
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=b295561b3b36
HOME=/root
```

The command passed in `--entrypoint` argument is temporary and once you exit out of the container and run the container again it would take the default `ENTRYPOINT` instructions if `--entrypoint` is not passed explicitly.

## Using `ENTRYPOINT` and `CMD` Together

There are fundamental differences between `ENTRYPOINT` and `CMD` but there can be many situations in which combining both would be the best solution for the Docker container. In such cases, the executable is defined with the `ENTRYPOINT`, while `CMD` specifies the default parameter.

When using both `ENTRYPOINT` and `CMD`, keep them in exec form.

```bash
$ docker build -t hands-on:v4 -f both.Dockerfile .

$ docker run hands-on:v4
Hello! My name is Teriz

$ docker run hands-on:v4 @teriz_de_ocampo
Hello! @teriz_de_ocampo
```

## Usecases

Prefer `ENTRYPOINT` to `CMD` when building executable Docker images, and you need this command to be always executed.

Use `CMD` if you need to provide extra default arguments that could be overwritten from the command line when the docker container runs.

It's not necessary to use both commands together, try to find your own use-case while building the Dockerfile.
