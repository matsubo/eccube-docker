EC-CUBE docker image
======================

Requirements
--------------------

- [docker](https://www.docker.com/)


How to run eccube docker image
---------------------


```
$ docker-compose up
$ open 'http://localhost:8000/'
```


Operation memo
-----------------------------

How to build image and push to docker hub.

```
% cd docker
% docker build .
% docker tag xxxxxx matsubo/eccube:latest
% docker push matsubo/eccube:latest
```

