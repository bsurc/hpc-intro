---
title: "Why use a Cluster?"
teaching: 10
exercises: 0
questions:
- "Why would I be interested in High Performance Computing (HPC)?"
- "What can I expect to learn from this course?"
objectives:
- "Describe what an HPC system is"
- "Identify how an HPC system could benefit you."
keypoints:
- "High Performance Computing (HPC) typically involves connecting to very large
  computing systems elsewhere in the world."
- "These other systems can be used to do work that would either be impossible
  or much slower on smaller systems."
- "HPC resources are shared by multiple users."
- "The standard method of interacting with such systems is via a command line
  interface."
---

Frequently, research problems that use computing can outgrow the capabilities
of the desktop or laptop computer where they started:

* A statistics student wants to cross-validate a model. This involves running
  the model 1000 times -- but each run takes an hour. Running on their laptop
  will take over a month! The final results are calculated after all 1000 models
  have run, but due to limited power of their laptop, the student typically
  only runs one model at a time (in __serial__). Since each model is independent,
  it's theoretically possible to run them all at once (in __parallel__).

* A genomics researcher has been using small sets of sequence data, but
  soon will be receiving a dataset that is 10 times larger. It's already
  challenging to open the datasets on their computer -- analyzing the larger
  dataset will probably crash it. In order to solve this research problem, a
  computer with __more memory__ would be required to analyze the much larger
  future dataset.

* An engineer is using a fluid dynamics package that has an option to run in
  parallel. In going from 2D to 3D simulations, the simulation time has more
  than tripled. They have tried the parallel option using the 8 cores on their
  desktop, but it slows down their computer so much that they can't use it for
  anything else and the run time is still very long. If they had access to a
  computer (or multiple computers) with more cores, they could run their simulation
  more quickly.

In all these cases, access to more (and larger) computers is needed. Those
computers should be usable at the same time, __solving many researchers'
problems in parallel__.

## Jargon Busting Presentation

Open the [HPC Jargon Buster]({{ site.url }}{{ site.baseurl }}/files/jargon.html#p1)
in a new tab. To present the content, press `C` to open a **c**lone in a
separate window, then press `P` to toggle **p**resentation mode.

{% include links.md %}

[dijkstra]: https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
[hyperscale]: https://en.wikipedia.org/wiki/Hyperscale_computing
[mapreduce]: https://en.wikipedia.org/wiki/MapReduce

{% include new-window-fix.html %}
