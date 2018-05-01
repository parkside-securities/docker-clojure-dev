# docker-clojure-dev

[![Docker Repository on Quay](https://quay.io/repository/parkside-securities/clojure-dev/status "Docker Repository on Quay")](https://quay.io/repository/parkside-securities/clojure-dev)

## Overview 
- It is a docker image based on [official clojure docker image](https://hub.docker.com/_/clojure/). 
- It adds development tools such as npm, juxt/mach, etc.


## Prerequisites
### docker
- [Install docker for Mac](https://docs.docker.com/docker-for-mac/install/)
- [Install docker CE for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

### juxt/mach
- [juxt/mach](https://github.com/juxt/mach#installing-mach)

## Build

### Quay Continuous Build

- This project is automatically built by [quay](https://quay.io/repository/parkside-securities/clojure-dev) on git push to GitHub repo. 

### Manual Build
- It is also possible to build and push manually by invoking `mach docker`. 

