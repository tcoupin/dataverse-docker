#!/bin/bash

eval "echo \"$(cat /opt/dv/dvinstall/default.config.template)\"" > /opt/dv/dvinstall/default.config.new

if [[ "$(cat /opt/dv/dvinstall/default.config.new)" = "$(cat /opt/dv/dvinstall/default.config)" ]]
then
	exit 0
fi

mv /opt/dv/dvinstall/default.config.new /opt/dv/dvinstall/default.config

cd /opt/dv/dvinstall/

/opt/glassfish4/bin/asadmin start-domain
./install -y -f
/opt/glassfish4/bin/asadmin stop-domain