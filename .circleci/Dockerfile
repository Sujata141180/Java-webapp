FROM node:10.16.3-buster
RUN apt-get update -y
RUN apt-get install apache2 -y
CMD cd /home/circleci/test/target/
CMD ["echo", `pwd`]
EXPOSE 80
