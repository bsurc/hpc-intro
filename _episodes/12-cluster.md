---
title: "Exploring Remote Resources"
teaching: 20
exercises: 10
questions:
- "How does my local computer compare to the remote systems?"
- "How does the login node compare to the compute nodes?"
- "Are all compute nodes alike?"
objectives:
- "Survey system resources using `nproc`, `free`, and the queuing system"
- "Compare & contrast resources on the local machine, login node, and worker
nodes"
- "Learn about the various filesystems on the cluster using `df`"
- "Find out `who` else is logged in"
- "Assess the number of idle and occupied nodes"
keypoints:
- "An HPC system is a set of networked machines."
- "HPC systems typically provide login nodes and a set of compute nodes."
- "The resources found on independent (worker) nodes can vary in volume and
  type (amount of RAM, processor architecture, availability of network mounted
  filesystems, etc.)."
- "Files saved on shared storage are available on all nodes."
- "The login node is a shared machine: be considerate of other users."
---

## Look Around the Remote System

Take a look at your home directory on the remote system:

```
{{ site.remote.prompt }} ls
```
{: .language-bash}

> ## What's different between your machine and the remote?
>
> Open a second terminal window on your local computer and run the `ls` command
> (without logging in to {{ site.remote.name }}). What differences do you see?
>
> > ## Solution
> >
> > You would likely see something more like this:
> >
> > ```
> > {{ site.local.prompt }} ls
> > ```
> > {: .language-bash}
> > ```
> > Applications Documents    Library      Music        Public
> > Desktop      Downloads    Movies       Pictures
> > ```
> > {: .output}
> >
> > The remote computer's home directory shares almost nothing in common with
> > the local computer: they are completely separate systems!
> {: .solution}
{: .discussion}

Most high-performance computing systems run the Linux operating system, which
is built around the UNIX [Filesystem Hierarchy Standard][fshs]. Instead of
having a separate root for each hard drive or storage medium, all files and
devices are anchored to the "root" directory, which is `/`:

```
{{ site.remote.prompt }} ls /
```
{: .language-bash}
```
bin   etc   lib64  proc  sbin     sys  var
boot  {{ site.remote.homedir | replace: "/", "" }}  mnt    root  scratch  tmp  working
dev   lib   opt    run   srv      usr
```
{: .output}

The "{{ site.remote.homedir | replace: "/", "" }}" directory is the one where
we generally want to keep all of our files. Other folders on a UNIX OS contain
system files and change as you install new software or upgrade your OS.

> ## Using HPC filesystems
>
> On HPC systems, you have a number of places where you can store your files.
> These differ in both the amount of space allocated and whether or not they
> are backed up.
>
> * __Home__ -- a _network filesystem_, data stored here is available
>   throughout the HPC system, and is backed up periodically; however, users
>   are limited on how much they can store.
> * __Scratch__ -- also a _network filesystem_, which has more space available
>   than the Home directory, but it is not backed up, and should not be used
>   for long term storage.
{: .callout}

You can also explore the available filesystems using `df` to show **d**isk
**f**ree space. The `-h` flag renders the sizes in a human-friendly format,
i.e., GB instead of B. The **t**ype flag `-T` shows what kind of filesystem
each resource is.

```
{{ site.remote.prompt }} df -Th
```
{: .language-bash}

> ## Different results from `df`
>
> * The local filesystems (ext, tmp, xfs, zfs) will depend on whether
>   you're on the same login node (or compute node, later on).
> * Networked filesystems (beegfs, cifs, gpfs, nfs, pvfs) will be similar
>   -- but may include {{ site.remote.user }}, depending on how it
>   is [mounted][mount].
{: .discussion}

> ## Shared Filesystems
>
> This is an important point to remember: files saved on one node
> (computer) are often available everywhere on the cluster!
{: .callout}

## Nodes

Recall that the individual computers that compose a cluster are called _nodes_.
On a cluster, there are different types of nodes for different types of tasks.
The node where you are right now is called the _login node_. A login node
serves as the access point to the cluster _for all users_.

As a gateway, the login node should not be used for time-consuming or
resource-intensive tasks as consuming the cpu or memory of the login node
would slow down the cluster for everyone! It is well suited for uploading
and downloading files, minor software setup, and submitting jobs to the
scheduler. Generally speaking, in these lessons, we will avoid running
jobs on the login node.

Who else is logged in to the login node?

```
{{ site.remote.prompt }} who
```
{: .language-bash}

This may show only your user ID, but there are likely several other people
(including fellow learners) connected right now.

The real work on a cluster gets done by the _compute_ (or _worker_) _nodes_.
compute nodes come in many shapes and sizes, but generally are dedicated to long
or hard tasks that require a lot of computational resources.

All interaction with the compute nodes is handled by a specialized piece of
software called a scheduler (the scheduler used in this lesson is called
{{ site.sched.name }}). We'll learn more about how to use the
scheduler to submit jobs next, but for now, it can also tell us more
information about the compute nodes.

For example, we can view all of the compute nodes by running the command
`{{ site.sched.info }}`.

```
{{ site.remote.prompt }} {{ site.sched.info }}
```
{: .language-bash}

{% include {{ site.snippets }}/cluster/queue-info.snip %}

A lot of the nodes are busy running work for other users: we are not alone
here!

There are also specialized machines used for managing disk storage, user
authentication, and other infrastructure-related tasks. Although we do not
typically logon to or interact with these machines directly, they enable a
number of key features like ensuring our user account and files are available
throughout the HPC system.

## What's in a Node?

All of the nodes in an HPC system have the same components as your own laptop
or desktop: _CPUs_ (sometimes also called _processors_ or _cores_), _memory_
(or _RAM_), and _disk_ space. CPUs are a computer's tool for actually running
programs and calculations. Information about a current task is stored in the
computer's memory. Disk refers to all storage that can be accessed like a file
system. This is generally storage that can hold data permanently, i.e. data is
still there even if the computer has been restarted. While this storage can be
local (a hard drive installed inside of it), it is more common for nodes to
connect to a shared, remote fileserver or cluster of servers.

{% include figure.html url="" max-width="40%"
   file="/fig/node_anatomy.png"
   alt="Node anatomy" caption="" %}

> ## Explore Your Computer
>
> Try to find out the number of CPUs and amount of memory available on your
> personal computer.
>
> Note that, if you're logged in to the remote computer cluster, you need to
> log out first. To do so, type <kbd>Ctrl</kbd>+<kbd>d</kbd> or `exit`:
>
> ```
> {{ site.remote.prompt }} exit
> {{ site.local.prompt }}
> ```
> {: .language-bash}
>
> > ## Solution
> >
> > There are several ways to do this. Most operating systems have a graphical
> > system monitor, like the Windows Task Manager. More detailed information
> > can be found on the command line:
> >
> > * Run system utilities
> >   ```
> >   {{ site.local.prompt }} nproc --all
> >   {{ site.local.prompt }} free -h
> >   ```
> >   {: .language-bash}
> >
> > * Read from `/proc`
> >   ```
> >   {{ site.local.prompt }} cat /proc/cpuinfo
> >   {{ site.local.prompt }} cat /proc/meminfo
> >   ```
> >   {: .language-bash}
> >
> > * (Or on mac) Run system_profiler
> >   ```
> >   {{ site.local.prompt }} system_profiler SPHardwareDataType
> >   ```
> >   {: .language-bash}
> {: .solution}
{: .challenge}

{% include {{ site.snippets }}/cluster/specific-node-info.snip %}

> ## Compare Your Computer and the Compute Node
>
> Compare your laptop's number of processors and memory with the numbers you
> see on the cluster compute node. What implications do
> you think the differences might have on running your research work on the
> different systems and nodes?
>
> > ## Solution
> >
> > Compute nodes are usually built with processors that have _higher
> > core-counts_ than the login node or personal computers in order to support
> > highly parallel tasks. Compute nodes usually also have substantially _more
> > memory (RAM)_ installed than a personal computer. More cores tends to help
> > jobs that depend on some work that is easy to perform in _parallel_, and
> > more, faster memory is key for large or _complex numerical tasks_.
> {: .solution}
{: .discussion}

> ## Differences Between Nodes
>
> Many HPC clusters have a variety of nodes optimized for particular workloads.
> Some nodes may have larger amount of memory, or specialized resources such as
> Graphics Processing Units (GPUs or "video cards").
{: .callout}

With all of this in mind, we will now cover how to talk to the cluster's
scheduler and use it to start running our scripts and programs!

{% include links.md %}

[fshs]: https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
[mount]: https://en.wikipedia.org/wiki/Mount_(computing)

{% include new-window-fix.html %}
