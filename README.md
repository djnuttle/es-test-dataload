# ES  test dataload

## Tools needed to build and run
* Docker
* docker-compose
* makefile 

## Make file - build and run
> make clean build run

## Check logs
> docker logs -tf cr_es-test-dataload-run-1

## Reference
* Data load script : https://github.com/oliver006/elasticsearch-test-data
* Docker : https://docs.docker.com/engine/reference/commandline/build/
* Docker compose : https://docs.docker.com/compose/reference/overview/
* Makefile : https://makefiletutorial.com/ https://www.docker.com/blog/containerizing-test-tooling-creating-your-dockerfile-and-makefile/
* Python base images: https://hub.docker.com/_/python 
