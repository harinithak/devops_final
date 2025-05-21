#!/bin/bash
docker build -t test .
docker run -itd -p 90:80 test