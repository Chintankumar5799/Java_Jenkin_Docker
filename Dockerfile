FROM openjdk 
EXPOSE 9090
Add target/devops-integration.jar devops-integration.jar
ENTRYPOINT [ "java","-jar","/devops-integration.jar" ]