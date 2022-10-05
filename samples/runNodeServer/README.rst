===============
Run Node Server
===============

About
-----

Containers in different docker host networks can communicate between themselves, but not between networks.

Demo
----

Run ``demo.sh`` to build and run the container. Check that it's accessible from the docker host:

.. code:: bash

   $ curl http://0.0.0.0:3000
   server 'node-1' says 'hello!'

Clean resources with:

.. code:: bash

   docker stop node-1
   docker rm node-1
   docker rmi node-1
