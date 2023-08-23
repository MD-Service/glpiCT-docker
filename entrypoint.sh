#!/bin/bash

# Déplacement dans le dossier de travail
cd /app/glpiCT

# Activation de l'environement Python
source .venv/bin/activate

# Éxécution du script avec les variable d'environement
python3 main.py -u $GLPI_URL -t $API_TOKEN -s $SEUIL_ALERT -p $SERVEUR_PORT -m $SERVEUR_SMTP