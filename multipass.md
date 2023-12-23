## Installation Notes

- Hyper-V is only available for Windows 10 and 11 Pro editions.
- For other editions, use VirtualBox as your hypervisor.
- On initial installation, I got the following error message:

  ```
  launch failed: The Hyper-V service does not exist. Ensure Hyper-V is installed correctly.
  ```

- If Hyper-V is installed and enabled, restart your PC in order for Hyper-V to be fully enabled.

### Check if Hyper-V is installed

1. Open the **Control Panel**
2. Click on **Programs**
3. Click **Turn on Windows features on or off**
4. Check if Hyper-V is there/listed, and checked.

## Check if Hyper-V is enabled

1. Go to **System Information**.
2. At the **Summary** section, confirm that an item with a key of _"A hypervisor has been detected. Features required for Hyper-V will not be displayed"_ is listed.

# Multipass Commands

- multipass launch docker --name manager1
- multipass ls
- multipass shell manager1

<table>
  <thead>
    <tr>
      <th>Command</th>
      <th>Other Options</th>
      <th>Page</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>multipass launch docker --name manager1</code></td>
      <td><code>--memory 512M</code></td>
      <td>147</td>
    </tr>
    <tr>
      <td><code>multipass ls</code></td>
      <td>-</td>
      <td>147</td>
    </tr>
    <tr>
      <td><code>multipass shell manager1</code></td>
      <td>-</td>
      <td>147</td>
    </tr>
    <tr>
      <td><code>multipass stop manager1</code></td>
      <td>-</td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>multipass delete manager1</code></td>
      <td>-</td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>multipass purge</code></td>
      <td>-</td>
      <td>-</td>
    </tr>
  </tbody>
</table>

## Set-up Issue of 3 Managers by 3 Workers

```bash
Theresa@DESKTOP-BRU6CD7 ~
$ multipass launch docker --name manager1
launch failed: Start-VM : 'manager1' failed to start.
Not enough memory in the system to start the virtual machine manager1.
Could not initialize memory: Not enough memory resources are available to complete this operation. (0x8007000E).
'manager1' failed to start. (Virtual machine ID DE6E79C5-233C-4F8E-B704-708129B1D9E2)
Not enough memory in the system to start the virtual machine manager1 with ram size 4096 megabytes. (Virtual machine
ID DE6E79C5-233C-4F8E-B704-708129B1D9E2)
'manager1' could not initialize memory: Not enough memory resources are available to complete this operation.
(0x8007000E). (Virtual machine ID DE6E79C5-233C-4F8E-B704-708129B1D9E2)
At line:1 char:1
+ Start-VM -Name manager1
+ ~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : FromStdErr: (:) [Start-VM], VirtualizationException
    + FullyQualifiedErrorId : OutOfMemory,Microsoft.HyperV.PowerShell.Commands.StartVM

Theresa@DESKTOP-BRU6CD7 ~
$ multipass launch docker --name manager1 --mem 512M
warning: "--mem" long option will be deprecated in favour of "--memory" in a future release. Please update any scripts, etc.
launch failed: Requested Memory size is less than Blueprint minimum of 4G
```
