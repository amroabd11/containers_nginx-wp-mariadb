# This project has been created as part of the 42 curriculum by aamraouy

## note : 'https://docs.docker.com/reference/compose-file/' --> this website is a doc about docker compose file

# Description :
Inception is a project from 42 school .
the project is about building a multi-service infrastructure based on Docker and Docker compose. using the concept of containerization,
the inception aims to manage or run each service within an isolated container , as well as it focus on orchestrating those
services with the help of docker compose.
the core infrastructure consists of three services :</br>
**NGINX** the entrypoint to my infrastructure, uses HTTPS to handle requests. it is the reverse proxy to my infrastructure.</br>
**WordPress + PHP-FPM** serving dynamic resources and nginx depends on it, also uses pfp-fpm as cgi to respond to requests that 
requires some code to be executed in the backend .</br>
**Mariadb** provides persistent database storage for wordpress.</br>

# Instructions:
> - ```make``` : this rule in makefile calls all, and does the building and running of the whole infra.
> - ```make clean``` : this rule runs system prune -f to delete all the containers dependencies such images and running ps.
> - ```make fclean``` : this rule calls clean and rm volumes and networks .
> - ```make re``` : calls fclean and all.

# Resources:
> - a book by Nigel Poulton ```https://github.com/rohitg00/DevOps_Books/blob/main/Docker%20Deep%20Dive%20Zero%20to%20Docker%20in%20a%20single%20book%20(Nigel%20Poulton)%20(z-lib.org).pdf```
> - https://www.youtube.com/watch?v=-YnMr1lj4Z8 youtube video by liveOverflow
> - follow this docker blog guide https://blog.pmunhoz.com/docker/docker-containers-introduction
> - https://blog.nginx.org/blog/what-are-namespaces-cgroups-how-do-they-work
> - this guy has 3 parts where he explains containers - https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504
> - https://github.com/compose-spec/compose-spec for docker compose   


# Project Description:
> The underlying of this project has included one main base image i built on top of it all the 3 images which is ```debian:bookworm```.
as well the infrastructure is as follow: nginx connects to wordpress in port 9000 and wordpress connects to mariadb on port 3306, and only nginx who's exposed on port 443 for tls.
By using docker i was able to connect each service to another using docker compose functionality besides docker compose build and run .
#### docker vs VMs
| docker                           | VMs                                            |
|:---------------------------------|-----------------------------------------------:|
|shares the host kernel futures    | it uses its own kernel                         |
|starts in miliseconds             | it takes minutes to boot                       |
|weaker isolation                  | stronger isolation since it uses full emulation|

### secrets vs environements
> 1. secrets:
> > credentials are stored encrypted in docker swarm.
> 2. env:
> > data stored in plain text.

### docker network vs host
> 1. docker network:
> > containers connect via dns meaning they are isolated by net namespace.
> 2. host network:
> > removes this isolation by attaching the containers network layer directly to the host's network stack.

### docker volumes vs bind mounts
> 1. docker volumes:
> > handled completly by docker and volumes are stored privatly in /var/lib/docker/volumes.
> 2. bind mounts:
> > it requires the file or folder to be already exist in the host to bind it, also depends on the host 's os structure.

FOR more details check out :
> {my projects link} USER_DOC.md & DEV_DOC.md
