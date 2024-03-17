### jenkins:lts-jdk17 docker-compose deployment

1. Start the services in detached mode
```lang-shell
docker compose up -d
```
2. Login to the Jenking UI: http://localhost:8080
3. Complete the initialization
4. Create x.509 Client Credentials Server Credentials
```lang-shell
docker exec jenkins-docker-1 cat /certs/client/key.pem
docker exec jenkins-docker-1 cat /certs/client/cert.pem
docker exec jenkins-docker-1 cat /certs/server/ca.pem
```
5. Configure the Jenkins Cloud plugin with the x.509 Client Credentials
6. Test the connection
