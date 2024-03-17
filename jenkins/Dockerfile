FROM docker:25.0.4-cli as docker
FROM jenkins/jenkins:2.440.1-alpine-jdk17
USER root
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt
USER jenkins
