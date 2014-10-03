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

```
$ git clone xxxxxx.git
$ cd xxxxx
$ docker build -t eccube/spike .
$ docker run -it -p 80 eccube/spike
```

`Ctrl+p, Ctrl+q` to escape from container.

