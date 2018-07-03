Based on https://github.com/IQSS/dataverse-docker

## Dataverse-docker

Ship dataverse into docker with docker-compose.

### Using Docker
* Make sure you have docker and docker-compose installed
* Build all containers with Docker Compose `docker-compose build` 
* Run `docker-compose up` so start Dataverse

Standalone Dataverse in English should be running on http://localhost:8080

Default user/password: dataverseAdmin/admin and after you should change it.

If it's not coming up please check if all required containers are up: `docker ps`

```

CONTAINER ID        IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                          NAMES

3a30792b22fe        dataversedocker_dataverse             "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:443->443/tcp, 0.0.0.0:8080->8080/tcp   dataversedocker_dataverse_1

8903ffab7d79        dataversedocker_solr                  "/entrypoint.sh solr"    About a minute ago   Up About a minute   0.0.0.0:8983->8983/tcp                         dataversedocker_solr_1

e652e204e6bb        postgres:9-alpine                     "docker-entrypoint.sh"   14 minutes ago       Up About a minute   0.0.0.0:5432->5432/tcp                         dataversedocker_postgres_1
```

### Install process

If needed, dataverse install process will be run at container boot. Dataverse is installed on first boot, if `FORCE_SETUP_DATAVERSE` env var is defined or if the provided env vars are differents from the last configuration.

You can customize with the following env vars (and default values):

```
HOST_DNS_ADDRESS=localhost
ADMIN_EMAIL=foo@bar.com
MAIL_SERVER=mail.foobar.org
GLASSFISH_DIRECTORY=/opt/glassfish4
POSTGRES_ADMIN_PASSWORD=secret
POSTGRES_SERVER=postgres
POSTGRES_PORT=5432
POSTGRES_DATABASE=dvndb
POSTGRES_USER=dvnapp
POSTGRES_PASSWORD=secret
SOLR_LOCATION=solr:8983
TWORAVENS_LOCATION="NOT INSTALLED"
RSERVE_HOST=localhost
RSERVE_PORT=6311
RSERVE_USER=rserve
RSERVE_PASSWORD=rserve
```


More on https://github.com/IQSS/dataverse-docker/blob/master/README.md