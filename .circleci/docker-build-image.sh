#!/bin/bash
docker build -t mycircleci:3 -f .circleci/Dockerfile .
docker login
docker tag mycircleci:3 sujata8073/mycircleci
docker push sujata8073/mycircleci
