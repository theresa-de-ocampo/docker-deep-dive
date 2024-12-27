# ADD vs. COPY

## `COPY` Instruction

- The Dockerfile `COPY` command also cares about the presence of the trailing slash, using it to determine whether the destination should be considered a file or directory.
- If `<src>` is a directory, the entire contents of the directory are copied.

## `ADD` Instruction

- Copies new files, directories, or remote file URLs from `<src>`, and adds them to the filesystem of the image at path `<dest>`.
- `COPY` is the same as `ADD` without the tar, and remote URL handling. `COPY` supports basic copying of files into the container, from the build context or from a stage in a multi-stage build. `ADD` supports features for fetching files from remote HTTPs and Git URLs, and extracting tar files automatically when adding files from the build context.
- All new files and directories are created with a UID and GID of 0, unless the optional `--chown` flag specifies a given username, groupname, or UID/GUID combination to request specific ownership of the content added.
- Providing a username without groupname or a UID without GID will use the same numeric UID as the GID.

  ```
  ADD [--chown=<user>:<group>] <src> <dest>
  ADD --chown=55:mygroup files* /somedir/
  ADD --chown=1 files* /somedir/
  ADD --chown=myuser:mygroup --chmod=655 files* /somedir/
  ```

### `chown` Command

- An abbreviation of _change ownership_.
- The `chown` and `chmod` features are only supported on Dockerfiles used to build Linux containers.
