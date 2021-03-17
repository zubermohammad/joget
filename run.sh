#/bin/bash
eval "echo \"$(cat /opt/joget/data/app_datasource-profile.template)\"" > /opt/joget/wflow/app_datasource-default.properties
cp /opt/joget/data/app_datasource.template /opt/joget/wflow/app_datasource.properties

mv /opt/joget/wflowbak/* /opt/joget/wflow

/opt/joget/tomcat8.sh run