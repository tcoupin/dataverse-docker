FROM centos:7

#ARG GLASSFISH_VERSION=4.1.2
ARG GLASSFISH_VERSION=4.1
ARG DATAVERSE_VERSION=4.14

# Download requirements
ADD https://download.oracle.com/glassfish/${GLASSFISH_VERSION}/release/glassfish-${GLASSFISH_VERSION}.zip /tmp
#ADD http://dlc-cdn.sun.com/glassfish/${GLASSFISH_VERSION}/release/glassfish-${GLASSFISH_VERSION}.zip /tmp
ADD "http://search.maven.org/remotecontent?filepath=org/jboss/weld/weld-osgi-bundle/2.2.10.Final/weld-osgi-bundle-2.2.10.Final-glassfish4.jar" /tmp/weld-osgi-bundle-2.2.10.Final-glassfish4.jar
ADD http://stedolan.github.io/jq/download/linux64/jq /usr/bin/
ADD https://github.com/IQSS/dataverse/releases/download/v${DATAVERSE_VERSION}/dvinstall.zip /opt/dv/


# Setup Glassfish
RUN chmod +x /usr/bin/jq && \
	yum install -y unzip java-1.8.0-openjdk-devel postgresql perl ImageMagick && \
	cd /opt && \
	unzip /tmp/glassfish-${GLASSFISH_VERSION}.zip && \
	rm /opt/glassfish4/glassfish/modules/weld-osgi-bundle.jar && \
	mv /tmp/weld-osgi-bundle-2.2.10.Final-glassfish4.jar /opt/glassfish4/glassfish/modules

ENV PATH=$PATH:/opt/glassfish4/bin \
	JAVA_HOME=/usr/lib/jvm/java-openjdk

EXPOSE 4848 8080 8181

# Setup Dataverse
WORKDIR /opt/dv/
RUN unzip dvinstall.zip

COPY default.config.template /opt/dv/dvinstall
COPY entrypoint.sh /
COPY setup_dataverse.sh /

ENV HOST_DNS_ADDRESS=localhost \
	GLASSFISH_DIRECTORY=/opt/glassfish4 \
	ADMIN_EMAIL=foo@bar.com \
	MAIL_SERVER=mail.foobar.org \
	POSTGRES_ADMIN_PASSWORD=secret \
	POSTGRES_SERVER=postgres \
	POSTGRES_PORT=5432 \
	POSTGRES_DATABASE=dvndb \
	POSTGRES_USER=dvnapp \
	POSTGRES_PASSWORD=secret \
	SOLR_LOCATION=solr:8983 \
	TWORAVENS_LOCATION="NOT INSTALLED" \
	RSERVE_HOST=localhost \
	RSERVE_PORT=6311 \
	RSERVE_USER=rserve \
	RSERVE_PASSWORD=rserve


ENTRYPOINT ["/entrypoint.sh"]
CMD ["asadmin", "start-domain", "-v"]
