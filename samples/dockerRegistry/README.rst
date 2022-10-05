========
Registry
========

About
-----

Publish your image to the docker `registry <https://hub.docker.com/repository/docker/lifespline/demo-docker>`_.


Demo
----

Authenticate with the registry:

.. code:: bash

   docker login docker.io/lifespline/demo-docker
   Username: lifespline
   Password:

Run ``demo.sh`` to build, publish and pull the image. Test that:

.. code:: bash

   $ curl http://0.0.0.0:3000
   server 'node-1' says 'hello!'

Clean resources with ``clean.sh``
