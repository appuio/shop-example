# README

The **[APPUiO Microservices Example](http://docs.appuio.ch/en/latest/#microservices-example)** is a comprehensive documentation that describes how one could build continuous integration pipelines that build and deploy an exemplary microservice application to **APPUiO** (RedHat OpenShift). This repository is the umbrella repository that contains all the sources and tools needed to work through the documentation.


## Instructions

The example application can be started up locally using the included `docker-compose.yml`. Docker Compose as well as all tools necessary for building and running the application are included in the provided `Vagrantfile` if you don't already have them installed locally.


### Cloning the repository

To clone the repository, make sure you include submodules in your `git clone` command by using `git clone --recursive -j8 https://github.com/appuio/shop-example.git`.


### Configuring and starting the Vagrant machine

To start the application with [**Vagrant**](https://www.vagrantup.com/downloads.html), you will need to make sure you have installed an appropriate version (we developed with Vagrant 1.9.3). To run the application with our provided Vagrant machine, you will also need to configure the VM appropriately. This involves adjusting some simple configuration values in `vagrant/Vagrantfile`:

* Update `$gitFolder` with the absolute path to the location of your ``shop-example"" root directory. This will allow vagrant to access the source code of all services as well as the docker-compose configuration.
* Feel free to perform any other modifications you like (the important params are marked with a `PARAM:` prefix).

After modifying the Vagrantfile, switch to the `vagrant` directory and start up a new VM with `vagrant up`. This will take a while on the first run, as Vagrant downloads and installs the dependencies necessary later on. Once Vagrant is done, connect to the VM using `vagrant ssh`.


### Building the application images

When using docker-compose, Dockerfiles can be automatically built when running the application with `docker-compose up --build`. However, as some of our services (**API** and **orders**) are built using Source-To-Image instead of using Dockerfiles, we need to build them with the S2I binary before running the application. Furthermore, the **users** service needs to be compiled with the builder image and the **webserver** service needs to be bundled with Webpack before being packaged with the Dockerfile. These are all special cases that docker-compose can't natively handle.

As such, to build all services at once, run the `start-build.sh` script provided in the root folder of the repository in your Vagrant VM. The script will prepare each service as necessary such that they can then be run with docker-compose. Additionally, each service repository contains a separate docker-compose file and a script that only builds that specific service (so you can only run one specific service at a time).

After the build script finished successfully, you will need to find the IP address of your virtual machine (using ifconfig, ipconfig or similar). Update the IP address in the root `docker-compose.yml` such that the frontend knows where to reach the backend of the application. The application can now finally be run with `docker-compose up --build` and will be exposed on port 80 of your virtual machine. To access it from outside the VM, simply open the IP of your VM in any browser.



