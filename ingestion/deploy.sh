#!/bin/sh

docker build -t data-generation .

docker tag data-generation:latest cdliotprototype/data-generation:latest

docker push cdliotprototype/data-generation:latest
