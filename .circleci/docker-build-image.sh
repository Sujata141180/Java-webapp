#!/bin/bash
docker build -t mycircleci:3 --build-arg --file .
docker login
docker push sujata8073/mycircleci:3
