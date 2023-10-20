# Image de base
FROM debian:12.1

# Désactive les intéractions
ENV DEBIAN_FRONTEND noninteractive

# Création du dossier de travail
RUN mkdir -p /app

# Copie de l'application dans le dossier de travail
COPY glpiCT /app/glpiCT

# Installation de Python et des dépendences
RUN apt update \
	&& apt install --yes --no-install-recommends \
		python3 \
		python3-pip \
		python3.11-venv \
		&& rm -rf /var/lib/apt/lists/* \
	&& python3 -m venv /app/glpiCT/.venv \
	&& /app/glpiCT/.venv/bin/pip3 install -r /app/glpiCT/requirements.txt


# Copie de l'entrypoint
COPY entrypoint.sh /opt/
# Attribution des droits d'éxécution
RUN chmod +x /opt/entrypoint.sh

# Ajout du volume
VOLUME /app

# Déclaration de l'entrypoint
ENTRYPOINT [ "/bin/bash", "-c", "source ~/.bashrc && /opt/entrypoint.sh ${@}", "--" ]
