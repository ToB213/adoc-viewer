#!/bin/bash
sudo docker pull asciidoctor/docker-asciidoctor
sudo docker run --rm -v $(pwd):/documents asciidoctor/docker-asciidoctor bash convert.sh
sudo docker build -t asciidoc-nginx .
sudo docker run -d -p 8080:80 --name asciidoc-nginx asciidoc-nginx
