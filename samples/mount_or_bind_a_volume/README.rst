.. raw:: html

   <a href="https://github.com/lifespline/samples-docker.git"><img loading="lazy" width="149" height="149" src="https://github.blog/wp-content/uploads/2008/12/forkme_left_darkblue_121621.png?resize=149%2C149" class="attachment-full size-full" alt="Fork Me On Github" data-recalc-dims="1"></a>

======================
Mount or Bind a Volume
======================

Exercise
--------

Run `demo.sh` to build a volume, a container and run the container. Write `test` to:

.. code:: shell

   docker container exec -it node-volume nano /home/test.txt


Verify that:

.. code:: shell

   sudo cat /var/lib/docker/volumes/nodeVolume/_data/test.txt

yields `test`. Write `test` to:

.. code:: shell

   docker container exec -it node-binding nano /home/test.txt

Verify that:

.. code:: shell

   cat ~/test.txt

yields `test`.
