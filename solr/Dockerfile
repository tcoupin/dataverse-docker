FROM solr:7.3.1-alpine

ARG DATAVERSE_VERSION=4.14


RUN cp -r server/solr/configsets/_default server/solr/collection1

ADD --chown=solr:solr https://raw.githubusercontent.com/IQSS/dataverse/v${DATAVERSE_VERSION}/conf/solr/7.3.1/schema.xml /opt/solr/server/solr/collection1/conf
ADD --chown=solr:solr https://raw.githubusercontent.com/IQSS/dataverse/v${DATAVERSE_VERSION}/conf/solr/7.3.1/solrconfig.xml /opt/solr/server/solr/collection1/conf


RUN	start-local-solr && \
	solr create_core -c collection1 -d /opt/solr/server/solr/collection1/  && \
	stop-local-solr
