Dear user, this guide is to show you in simple terms how the infrastruture is working and to interact with it.

## services within the infra:
> nginx:
exposes port 443 for a secured communication over https. uses nginx.conf file -you could find in /etc/nginx/- to run
or listens for trafic and bridge also to wordpress:9000.
> mariadb:
listen on trafic in port 3306. check that also by using docker ps.
> wordpress:
listens on port 9000 and uses cgi to respond to request that needs runing a php script to render the page. 
## view running containers
cmd: `` docker ps ``

> list logs of each container by running `` docker logs <container-name>``
also u may inspect a container and thats by using the inspect arg within docker.
## running and stoping the project 
`` make run`` or just ``make``
``make stop`` or ctr + c
check the makefile to understand the functionality of each command.

## run a cmd from outside of a container
that s is by using docker exec -it *nameOFcontainer* cmd
**exp:**
> > docker exec -it wordpress wp core is-installed --allow-root

## accessing the website
after compiling and running the code with ``make`` you are able to head into a brwoser and connect to localhost 443.
there you have two accounts admin and normal user with author access. for the pass you can create your own .env file with srcs/ 
and the variables must be named based on there use in database creation and config.

