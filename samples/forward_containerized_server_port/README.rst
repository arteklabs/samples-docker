Forward contaneirized server port
=================================

About
-----

Launch two docker containers ``server_at_8000``, ``server_at_8001`` with a server listenning on port 8000 in each. On container ``server_at_8000``, map the container port 800o to the docker host port 8000, on the container ``server_at_8000``, map the container port 800o to the docker host port 8001. Verify that both servers respond with ``curl``.

Solution
--------

Run ``solution.sh`` to build and run the container. Check that it's accessible from the docker host:

.. code:: bash

   $ curl http://0.0.0.0:8000
   server 'server_at_8000' says 'hello!'
   $ curl http://0.0.0.0:8001
   server 'server_at_8001' says 'hello!'

Clean resources with:

.. code:: bash

   docker stop server_at_8000 server_at_8001
   docker rmi server
