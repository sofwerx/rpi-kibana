#!/bin/bash -e
. .env
docker build -t ${TRAVIS_REPO_SLUG}:latest .
