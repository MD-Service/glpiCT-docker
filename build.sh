#!/bin/bash
if [[ -f Dockerfile  && -f entrypoint.sh && -d glpiCT ]]
then
	echo "Construction de l'image"
	docker build . -t "glpict-docker:1.0"
else
	echo "Des fichiers sont manquants"
fi
