<h5> This project has been created as part of the 42 curriculum by aamraouy</h5>

## note : 'https://docs.docker.com/reference/compose-file/' --> this website is a doc about docker compose file
<h1> Description :</h1>
Inception is a project from 42 school .
the project is about building a multi-service infrastructure based on Docker and Docker compose. using the concept of containerization,
the inception aims to manage or run each service within an isolated container , as well as it focus on orchestrating those
services with the help of docker compose.
the core infrastructure consists of three services :</br>
-** NGINX **- the entrypoint to my infrastructure, uses HTTPS to handle requests. it is the reverse proxy to my infrastructure.
-** WordPress + PHP-FPM **- serving dynamic resources and nginx depends on it, also uses pfp-fpm as cgi to respond to requests that 
requires some code to be executed in the backend .
-** Mariadb **- provides persistent database storage for wordpress.

##note this blog is for namespaces : https://blog.pmunhoz.com/docker/docker-behind-containers
<h1> Namespaces:</h1>
<article> this part of docker is the important one to know since it showcaseshow docker is functionning under the hood .</br>
	first thing is that there are multiple namespaces as follow :
<div> PID namespace:</div>
<div> mnt namespace:</div>
<div> IPC namespace:</div>
<div> USER/GROUP namespace:</div>
<div> Cgroups namespace:</div>


<h2> docker-compose DOCS: "https://github.com/compose-spec/compose-spec" </h2>
</article>
