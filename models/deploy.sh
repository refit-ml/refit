#!/bin/sh

docker build -t model-training .

docker tag model-training:latest cdliotprototype/model-training:latest

docker push cdliotprototype/model-training:latest
