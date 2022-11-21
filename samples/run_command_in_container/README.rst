.. raw:: html

   <a href="https://github.com/lifespline/samples-docker.git"><img loading="lazy" width="149" height="149" src="https://github.blog/wp-content/uploads/2008/12/forkme_left_darkblue_121621.png?resize=149%2C149" class="attachment-full size-full" alt="Fork Me On Github" data-recalc-dims="1"></a>

========================
Run Command in Container
========================

Exercise
--------

.. code:: bash

   $ docker run --name=tmp ubuntu echo hello from the docker container
   hello from the docker container
   $ docker rm tmp
