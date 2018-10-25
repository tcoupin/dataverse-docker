#!/bin/bash

eval "echo \"$(cat /opt/dv/dvinstall/default.config.template)\"" > /opt/dv/dvinstall/default.config.new

if [[ "$(cat /opt/dv/dvinstall/default.config.new)" = "$(cat /opt/dv/dvinstall/default.config)" ]]
then
	exit 0
fi

mv /opt/dv/dvinstall/default.config.new /opt/dv/dvinstall/default.config

cd /opt/dv/dvinstall/

/opt/glassfish4/bin/asadmin start-domain

## Temp workaround for https://github.com/IQSS/dataverse/issues/5234
/opt/glassfish4/bin/asadmin create-jvm-options "-Dfile.encoding=UTF8"

./install -y -f
/opt/glassfish4/bin/asadmin stop-domain