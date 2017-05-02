README
======

This repository is an umbrella repository that contains the entire example project built for the [APPUiO Microservices Example](http://docs.appuio.ch/en/latest/#microservices-example).

The application can be started up locally using the included `docker-compose.yml`. Docker Compose as well as all tools necessary for building and running the application are included in the provided `Vagrantfile`.


Cloning the repository
---------------------

To clone the repository, make sure you include submodules in your `git clone` command by using `git clone --recursive -j8 https://github.com/appuio/shop-example.git`.


Starting the Vagrant machine
---------------------------

To start the application with [**Vagrant**](https://www.vagrantup.com/downloads.html), you will need to make sure you have installed an appropriate version (we developed with Vagrant 1.9.3).

Switch to the *vagrant* directory and start up a new VM with `vagrant up`. This will take a while on the first run, as Vagrant downloads and installs the dependencies necessary later on. Once Vagrant is done, connect to the VM using `vagrant ssh`.


Building the application images
------------------------------

When using docker-compose, one can specify that Dockerfiles should be automatically built on `docker-compose up`. As some of our services (**API** and **orders**) are built using Source-To-Image, we need to build those with the S2I binary before running the application with Docker Compose. Furthermore, the **users** service needs to be compiled with the builder image and the **webserver** service needs to be bundled before being packaged with the Dockerfile.

To build all services at once, use the `start-build.sh` script we provided in the repository. Each service repository also contains a script that only builds that specific service.

