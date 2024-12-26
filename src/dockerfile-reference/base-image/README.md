# Node Base Image vs. Alpine Base Image

Inspecting the image built from `alpine.Dockerfile`, it is significantly smaller than `node.Dockerfile`. If you check the packages installed by [node:22.12.0-alpine](https://hub.docker.com/layers/library/node/22.12.0-alpine3.21/images/sha256-5e74b07dd897c09c6ac5865ee02ebdcce696adc9582d422321106c154e6656a6), you'll see that it also includes other dependencies (`chalk`, `retry`, `graceful-fs`, etc.) that your project might not need out of the box.

<table>
  <tbody>
    <tr>
      <td><code>alpine.Dockerfile</code></td>
      <td>34,602,044</td>
    </tr>
    <tr>
      <td><code>node.Dockerfile</code></td>
      <td>56,361,650</td>
    </tr>
  </tbody>
</table>
