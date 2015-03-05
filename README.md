eccube docker image
======================

How to setup Docker on Mac OS X
--------------------

```
% git clone git@github.com:coreos/coreos-vagrant.git
% cd coreos-vagrant
% vagrant up 
% vagrant ssh
```



How to run eccube docker image
---------------------

### Pull from repository

```
$ docker pull matsubo/eccube
$ docker run -it -p 80 matsubo/eccube
```



### Build from base image by your self


```
$ git clone git@github.com:matsubo/eccube-docker.git
$ cd eccube-docker
$ docker build -t eccube/spike .
$ docker run -it -p 80 eccube/spike
```

`Ctrl+p, Ctrl+q` to escape from container.


Then access to container's 80 port via vagrant by your browser.


### Reference 

- Core OS -> Host OS port mapping setting.
  - https://github.com/coreos/coreos-vagrant/blob/master/Vagrantfile#L75
  - Vagrant can configure guest OS's port mapping auto matically.


Screenshot
-----------------------------


### Cheking the mapping port

![index page](https://github.com/matsubo/eccube-docker/blob/master/screenshot/docker_ps.png)



### Web browser

![index page](https://github.com/matsubo/eccube-docker/blob/master/screenshot/index.png)

Operation memo
-----------------------------

How to build image and push to docker hub.

```
% docker build .
% docker tag xxxxxx matsubo/eccube:latest
% docker push matsubo/eccube:latest
```

