#!/bin/bash
docker build -t mycircleci:latest -f .circleci/Dockerfile .
docker login -u sujata8073
docker tag mycircleci:latest sujata8073/circlecipractice:circlecii
docker push sujata8073/circlecipractice:circlecii
