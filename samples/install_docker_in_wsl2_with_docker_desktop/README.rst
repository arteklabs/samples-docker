Install Docker in WSL2 Ubuntu 20.04 with Docker Desktop
=======================================================

About
-----

Install Docker in WSL2 Ubuntu 20.04 with Docker Desktop.

Solution
--------

* Install WSL 2 Ubuntu 20.04
* Follow the `official docs <https://docs.docker.com/desktop/windows/wsl/>`_ to install Docker Desktop.
* Add your user to the windows docker users list:
    * computer management / local users and groups / groups / docker-users / add your user
    * logout and login to apply changes
*  Launch docker desktop:
    * settings / general / use the WSL 2 based engine
* WSL 2 Ubuntu 20.04:
    * ``sudo apt update``
    * ``sudo apt install docker.io``
    * ``docker --version``
    * ``docker run hello-world``
* edit ``C:\Users\<USER>\.docker\daemon.json`` such that ``"buildkit": false``
