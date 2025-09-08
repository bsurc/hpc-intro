---
title: "Connecting to a remote HPC system"
teaching: 10
exercises: 5
questions:
- "How do I log in to a remote HPC system?"
objectives:
- "Configure secure access to a remote HPC system."
- "Connect to a remote HPC system."
keypoints:
- "An HPC system is a set of networked machines."
- "HPC systems typically provide login nodes and a set of worker nodes."
- "The resources found on independent (worker) nodes can vary in volume and
  type (amount of RAM, processor architecture, availability of network mounted
  filesystems, etc.)."
- "Files saved on one node are available on all nodes."
---

## Secure Connections

The first step in using a cluster is to establish a connection from our laptop
to the cluster. When we are sitting at a computer, we have come to expect a
visual display with icons, widgets, and perhaps some windows or applications:
a _graphical user interface_, or GUI. Since computer clusters are remote
resources that we connect to over slow or intermittent interfaces (WiFi
and VPNs especially), it is more practical to use a _command-line interface_,
or CLI, to send commands as plain-text. If a command returns output, it is
printed as plain text as well. The commands we run today will not open a window
to show graphical results.

If you have already taken The Carpentries' courses on the UNIX Shell or
Version Control, you have used the CLI on your _local machine_ extensively.
The only leap to be made here is to open a CLI on a _remote machine_,
while taking some precautions so that other folks on the network can't see (or
change) the commands you're running or the results the remote machine sends
back. We will use the Secure SHell protocol (or SSH) to open an encrypted
network connection between two machines, allowing you to send & receive text
and data without having to worry about prying eyes.

{% include figure.html url="" max-width="50%"
   file="/fig/connect-to-remote.svg"
   alt="Connect to cluster" caption="" %}

SSH clients are usually command-line tools, where you provide the remote
machine address as the only required argument. If your username on the remote
system differs from what you use locally, you must provide that as well. If
your SSH client has a graphical front-end, such as PuTTY or MobaXterm, you will
set these arguments before clicking "connect." From the terminal, you'll write
something like `ssh userName@hostname`, where the argument is just like an
email address: the "@" symbol is used to separate the personal ID from the
address of the remote machine.

## Connect to the Cluster

After getting your account, please navigate to
[ondemand.boisestate.edu][ondemand], choose your university as the identity
provider, and log in with your university credentials.

From here you can acccess the shell, interactive apps like Jupyter and Rstudio,
and transfer files.

## Logging in with a Terminal Application

The [Lesson Setup]({{ page.root }}/setup) provides instructions for installing
a shell application with SSH. If you have not done so already, please open that
shell application with a Unix-like command line interface to your system.

To log in to Borah via ssh, we'll need to set up ssh keys according to the
follwing documentation: [Logging in Documentation][logging in]

You may have noticed that the prompt changed when you logged into the remote
system using the terminal. This change is important because it can help you
distinguish on which system the commands you type will be run when you pass
them into the terminal. This change is also a small complication that we will
need to navigate throughout the workshop. Exactly what is displayed as the
prompt (which conventionally ends in `$`) in the terminal when it is connected
to the local system and the remote system will typically be different for
every user. We still need to indicate which system we are entering commands
on though so we will adopt the following convention:

* `{{ site.local.prompt }}` when the command is to be entered on a terminal
  connected to your local computer
* `{{ site.remote.prompt }}` when the command is to be entered on a
  terminal connected to the remote system
* `$` when it really doesn't matter which system the terminal is connected to.

## Looking Around Your Remote Home

Very often, many users are tempted to think of a high-performance computing
installation as one giant, magical machine. Sometimes, people will assume that
the computer they've logged onto is the entire computing cluster. So what's
really happening? What computer have we logged on to? The name of the current
computer we are logged onto can be checked with the `hostname` command. (You
may also notice that the current hostname is also part of our prompt!)

```
{{ site.remote.prompt }} hostname
```
{: .language-bash}

```
{{ site.remote.host }}
```
{: .output}

So, we're definitely on the remote machine. Next, let's find out where we are
by running `pwd` to **p**rint the **w**orking **d**irectory.

```
{{ site.remote.prompt }} pwd
```
{: .language-bash}

```
{{ site.remote.homedir }}/{{ site.remote.user }}
```
{: .output}

Great, we know where we are! Let's see what's in our current directory:

```
{{ site.remote.prompt }} ls
```
{: .language-bash}
```
scratch
```
{: .output}

The system administrators have configured your home directory with a link
(a shortcut) to a scratch space reserved for you. You can also include
hidden files in your directory listing:

```
{{ site.remote.prompt }} ls -a
```
{: .language-bash}
```
  .            .bashrc           scratch
  ..           .ssh
```
{: .output}

In the first column, `.` is a reference to the current directory and `..` a
reference to its parent (`{{ site.remote.homedir }}`). You may or may not see
the other files, or files like them: `.bashrc` is a shell configuration file,
which you can edit with your preferences; and `.ssh` is a directory storing SSH
keys and a record of authorized connections.

{% include links.md %}

[ondemand]: https://ondemand.boisestate.edu
[logging in]: https://bsu-docs.readthedocs.io/en/latest/logging_in

{% include new-window-fix.html %}
