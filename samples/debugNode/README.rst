==========
Debug Node
==========

* install the docker extension ``ms-azuretools.vscode-docker``
* target

Demo
----

Authenticate with the `registry <https://hub.docker.com/repository/docker/lifespline/demo-docker>`_:

.. code:: bash

   $ docker login docker.io/lifespline/demo-docker
   Username: lifespline
   Password:


Run ``demo.sh`` to build, publish and pull the image. Test that:

.. code:: bash

   $ curl http://0.0.0.0:3000
   server 'node-1' says 'hello!'


Clean resources with ``clean.sh``
