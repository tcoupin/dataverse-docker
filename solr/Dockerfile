FROM solr:7.3-alpine



RUN cp -r server/solr/configsets/_default server/solr/collection1

ADD --chown=solr:solr https://raw.githubusercontent.com/IQSS/dataverse/v4.9.1/conf/solr/7.3.0/schema.xml /opt/solr/server/solr/collection1/conf
ADD --chown=solr:solr https://raw.githubusercontent.com/IQSS/dataverse/v4.9.1/conf/solr/7.3.0/solrconfig.xml /opt/solr/server/solr/collection1/conf


RUN	start-local-solr && \
	solr create_core -c collection1 -d /opt/solr/server/solr/collection1/  && \
	stop-local-solr
