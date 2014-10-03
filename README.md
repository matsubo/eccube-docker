eccube docker image
======================

How to setup Docker on Mac OS X
--------------------

```
% brew install docker
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
$ docker run -it matsubo/eccube /bin/bash
```

Then start server manually
```
# service mysql start
# service apache2 start
```



### Build from base image by your self


```
$ git clone xxxxxx.git
$ cd xxxxx
$ docker build -t eccube/spike .
$ docker run -it -p 80 eccube/spike
```

`Ctrl+p, Ctrl+q` to escape from container.


Then access to 80 port by your browser.


Screenshot
-----------------------------

### Web browser

![index page](https://github.com/matsubo/eccube-docker/blob/master/screenshot/index.png)


### Docker container sample

![index page](https://github.com/matsubo/eccube-docker/blob/master/screenshot/docker_ps.png)

