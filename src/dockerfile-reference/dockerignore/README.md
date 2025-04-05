# `.dockerignore`

- The `.dockerignore` file works by creating a file named `.dockerignore` in the **build context root**.
- Note that the build context here is the path used by docker build, not the location of the Dockerfile.

  ```bash
  docker build -f path/to/Dockerfile dir
  ```

- In the above example, `dir` is the build context root. In other words, `.dockerignore` should be placed in the `dir` directory.

- You can use the `.dockerignore` file to exclude files and directories from the build context. It can help reduce Docker image size, speed up `docker build`, and avoid unintended secret exposure.

## Image Size

First, remember that Docker is a client-server application. It consists of Docker client and Docker server. The Docker server can run on the same machine as the client or in the cloud. In order to create a new Docker image, the Docker server needs access to the files you want to create an image from. Somehow, these files needs to be sent to the Docker server. The Docker client packs all build context files into a `tar` archive and uploads this archive to the Docker server.

```bash
 => => transferring context: 9.12MB
```

The `.dockerignore` file is the tool that can help you define the Docker build context you really need. The Docker context should be minimal and secret-free.

## Cache Invalidation

If your working directory contains files that are frequently updated (logs, test results, git history, temporary cache files), you are going to regenerate the `COPY` layer for every `docker build`. If you don't manage the build context correctly, your builds will be very slow as cache cannot be used correctly.

## Unintended Secrets Exposure

If you copy files into your Docker image using `ADD .` or `COPY .` command, you may unintentionally include your whole Git history, and secret files like `.env`.

## Listing Dockerfile and `.dockerignore`

You can even use the `.dockerignore` file to exclude the Dockerfile and `.dockerignore` files. These files are still sent to the daemon because it needs them to do its job. But the `ADD` and `COPY` instructions do not copy them to the image.

### Should the Dockerfile itself be mentioned in `.dockerignore`?

It mostly boils down to personal preference. Some suggest to include the Dockerfile in the the Docker image (i.e., not to mention it in `.dockerignore`) as it can help the consumers of the image to understand how it was built. However, this is already possible using `docker history`.
