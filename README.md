PURPOSE
=======
Demonstrate some features of the ZCMD framework by providing a sample 
"zcmd stack" of containers.

CONVENTIONS
===========
The "zcmd stack" of containers is defined and managed in the **"stack" folder**.

 * stack/stack.env <-- This is where we define our stack environment values.
 * stack/docker-compose.yml <-- This where we define the services of our stack.
 * stack/custom <-- By convention, we place DEV, STAGE, PROD specific configuration files into this folder.
 
The runtime content of our stack services is maintained in the **"runtime-shared-files" folder**.

AVAILABLE SERVICES IN THIS DEMO STACK
=====================================
Apache Webserver Demonstration Page
 * localhost:11080
 * Look in the docker-compose.yml for configuration information

Phpmyadmin -- A database management program
 * localhost:18080
 * Documentation available at https://github.com/phpmyadmin
 * Look in the docker-compose.yml for login information

Adminer -- A database management program like phpmyadmin 
 * localhost:18888
 * Documentation available at https://docs.docker.com/samples/library/adminer/
 * Look in the docker-compose.yml for login information

Mysql -- A relational database management system
 * Documentation available at https://hub.docker.com/_/mysql
 * Look in the docker-compose.yml for configuration information
 
# Troubleshooting
 
*ISSUE*: In Windows WSL, when starting the stack, the webserver fails to bind the files. Message may contain text like the following:
`"Message":"Unhandled exception: Filesharing has been cancelled","StackTrace":"   at Docker.ApiServices.Mounting.FileSharing.`

*SOLUTION*: Enable filesharing in the Docker for windows Settings panel. See <https://github.com/docker/for-win/issues/5958> for more details.
