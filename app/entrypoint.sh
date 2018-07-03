#!/bin/bash


## Need setup if FORCE_SETUP_DATAVERSE is set or local default.config different from env vars
if [[ -z $FORCE_SETUP_DATAVERSE && -f /opt/dv/dvinstall/config.default ]]; then
	rm -f /opt/dv/dvinstall/config.default
fi
bash /setup_dataverse.sh

## Admin Password
#if [[ -z $ADMIN_PASSWORD ]]; then
#	ADMIN_PASSWORD=$(date| md5sum | head -c 10)
#fi
#echo "#############################################"
#echo "## Setup admin password: [$ADMIN_PASSWORD]      ##"
#echo "#############################################"
#echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd
#echo "AS_ADMIN_NEWPASSWORD=${ADMIN_PASSWORD}" >> /tmp/glassfishpwd
#asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1
#asadmin start-domain
#echo "AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}" > /tmp/glassfishpwd
#asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin
#asadmin --user=admin stop-domain
#rm /tmp/glassfishpwd


exec "$@"
