FROM java:7

EXPOSE 8080

RUN curl -O http://wolfbuild.prsn.us/view/PaaS%20POC/job/openshift-deploy-organization/ws/organization-api/target/organization-api-0.0.9-SNAPSHOT-jar-with-dependencies.jar
RUN curl -O http://wolfbuild.prsn.us/view/PaaS%20POC/job/openshift-deploy-organization/ws/organization-api/config/cloud-dev/environment.properties
RUN curl -O http://wolfbuild.prsn.us/view/PaaS%20POC/job/openshift-deploy-organization/ws/organization-api/config/cloud-dev/logback.xml

RUN mkdir -p config/dev
RUN mv environment.properties config/dev
RUN mv logback.xml config/dev

ENV SERVERS "java -classpath organization-api-0.0.9-SNAPSHOT-jar-with-dependencies.jar com.pearson.grid.organization.Main dev"
CMD sh -c "eval $SERVERS"
