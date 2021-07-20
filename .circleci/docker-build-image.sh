#!/bin/bash
docker build -t mycircleci:3 --build-arg --file .circleci/Dockerfile
docker login
docker push sujata8073/mycircleci:3
