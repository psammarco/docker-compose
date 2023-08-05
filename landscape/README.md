# Canonical Landscape 23.03 Docker Compose Automation

The aim of this project is to fully automate the deployment of Canonical Landscape 23.03 on Docker using Docker Compose.

## Landscape Core Components

+ APPSERVER
+ MSGSERVER
+ PINGSERVER
+ JOBHANDLER
+ ASYNC_FRONTEND
+ APISERVER
+ PACKAGEUPLOADSERVER
+ PACKAGESEARCH

## Configuration

Each component of the stack runs as an individual container and shares most of the configuration with the main _APPSERVER_ image.

The main config files shared with each component are:

```
/etc/landscape/service
/etc/rsyslog.conf
/scripts/defaults.entrypoint.sh
```

Each component uses a slightly modified Dockerfile derived from the main _APPSERVER_ image, along with a startup script in addition to the _defaults.entrypoint.sh_ script.

The primary configuration file for Landscape is _landscape/conf/app-server/service.conf_. You will need to edit it according to the desired setup, along with making adjustments in the docker-compose.yaml file.

The _APPSERVER_ container also runs the Apache2 web server to provide access to the Landscape web console. The web server config file is found at _landscape/conf/app-server/apache.conf_.

In this deployment approach, the Landscape standalone script is not used, requiring manual initial setup for both Postgres and RabbitMQ. Don't worry, this has also been taken care of.

Postgres and RabbitMQ startup config files can be found at:
```
landscape/conf/postgres_srv/init/users.sql
landscape/conf/rabbitmq/definitions.json
```

The users.sql startup script will create the postgres user, database and roles. When using docker-compose.yaml, this would normally be handled by the postgres image itself.
However, as this is a multidb setup, the _POSTGRES_DB_, _POSTGRES_USER_, and _POSTGRES_PASSWORD_ variables were used to set up the landscape_super user account instead.
RabbitMQ definitions.json file creates the landscape user and its vhost.

## Startup Priority

The docker-compose.yaml file defines the startup priority, where the _APPSERVER_ depends on both the _postgres_ and _rabbitmq_ containers and their services to be up and running.

Thus, health checks are declared to verify the availability of rabbitmq management and postgres services before the _APPSERVER_ is started.

Also, the remaining components rely on the _APPSERVER_ to bootstrap the landscape-schema. Another healthcheck is performed on the APPSERVER to confirm that the landscape-schema is up and healthy before initiating the other components.

## Data and Volumes
Several volumes have been created and assigned to their respective containers. These volumes hold essential data of the stack, providing you with the flexibility to back up and/or migrate the application whenever necessary.
```
  postgres_data
  rabbitmq_data
  landscape_data
  landscape_logs
  landscape-server_data
  landscape-server_logs
```

## Final Notes

As this is intended to be a Proof of Concept, it is your responsibility to harden the whole stack, implement SSL, add redundancy, allocate the appropriate amount of resources to each component based on your needs, as well as scale some of the components depending on the number of clients the application will be managing and overall traffic.

For more info please see the official [Landscape documentation](https://ubuntu.com/landscape/docs/manual-installation) from Canonical.

Cheers!
