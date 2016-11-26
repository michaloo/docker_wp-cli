# Docker image with WP-CLI installed

Want to run [WP-CLI](https://wp-cli.org/) command over your Wordpress
installation? Use this image :)

[![Build Status](https://travis-ci.org/michaloo/docker_wp-cli.svg?branch=master)](https://travis-ci.org/michaloo/docker_wp-cli)

## Installation

`docker pull michaloo/wp-cli`


## Usage

View WP-CLI info:

`docker run -it --rm michaloo/wp-cli wp --info`

View your Wordpress installation version (assuming that it is in `pwd`):

```docker run -it --rm -v `pwd`:/var/www/html michaloo/wp-cli wp core version```


Want install custom WP-CLI [packages](http://wp-cli.org/package-index/)?

Extend this image in your own `Dockerfile`. Just like in [dockerpresso-cli](https://github.com/michaloo/dockerpresso-cli) image:

```Dockerfile
# Uses wp-cli docker image
FROM michaloo/wp-cli

# And adds dockerpresso plugins:
RUN wp package install michaloo/wp-cli-environmentalize
```

## Notes

The USER is switched to `www-data` here to satisfy WP-CLI requirements.

The WORKDIR is changed to `/var/www/html`, HOME is set to `/var/www`, the WP-CLI
bash completion is installed there.

## Used in

Following projects use this image:

* [Dockerpresso](https://github.com/michaloo/dockerpresso)
