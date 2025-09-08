---
layout: page
title: Setup
root: .
---

Before the workshop, it is recommended to install or locate a terminal
application on with ssh. Though installation help will be provided at
the workshop, we recommend that these tools are installed (or at least
downloaded) beforehand.

> ## Bash and SSH
>
> This lesson requires a terminal application (`bash`, `zsh`, or others) with
> the ability to securely connect to a remote machine (`ssh`).
{: .prereq}

## Where to Type Commands: How to Open a New Shell

The shell is a program that enables us to send commands to the computer and
receive output. It is also referred to as the terminal or command line.

Some computers include a default Unix Shell program. The steps below describe
some methods for identifying and opening a Unix Shell program if you already
have one installed. There are also options for identifying and downloading a
Unix Shell program, a Linux/UNIX emulator, or a program to access a Unix Shell
on a server.

### Unix Shells on Windows

Computers with Windows operating systems do not automatically have a Unix Shell
program installed. We recommend using [MobaXterm](https://mobaxterm.mobatek.net)
Home Edition for this lesson as it can be used to run local shell commands and
access the cluster via ssh.

### Unix Shell on macOS

On macOS, the default Unix Shell is accessible by running the Terminal program
from the `/Application/Utilities` folder in Finder.

To open Terminal, try one or both of the following:

* In Finder, select the Go menu, then select Utilities. Locate Terminal in the
  Utilities folder and open it.
* Use the Mac ‘Spotlight’ computer search function (using <kbd>Command</kbd> +
  <kbd>Space</kbd>). Search for: `Terminal` and press <kbd>Return</kbd>.

For an introduction, see [How to Use Terminal on a Mac][mac-terminal].

### Unix Shell on Linux

On most versions of Linux, the default Unix Shell is accessible by running the
[(Gnome) Terminal](https://help.gnome.org/users/gnome-terminal/stable/) or
[(KDE) Konsole](https://konsole.kde.org/) or
[xterm](https://en.wikipedia.org/wiki/Xterm), which can be found via the
applications menu or the search bar.

### Special Cases

If none of the options above address your circumstances, try an online search
for: `Unix shell [your operating system]`.

<!-- links -->
[git4win]: https://gitforwindows.org/
[mac-terminal]: https://www.macworld.co.uk/feature/mac-software/how-use-terminal-on-mac-3608274/
[ms-wsl]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[ms-shell]: https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core?view=powershell-7
[mobax-gen]: https://mobaxterm.mobatek.net/documentation.html
[putty]: https://www.chiark.greenend.org.uk/~sgtatham/putty/
[unix-emulator]: https://www.cygwin.com/
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
