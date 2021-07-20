FROM node:10.16.3-buster
RUN apt-get update -y
RUN apt-get install apache2 -y
COPY /home/circleci/test/target/my-webapp.war /var/www/html
EXPOSE 80
