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
