FROM node:10.16.3-buster
RUN apt-get update -y
RUN apt-get install apache2 -y
COPY .circleci/target/my-webapp.war /var/www/html
RUN pwd
EXPOSE 80
