#!/bin/env bash

# Obtengo la carpeta del script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ACTUAL_PATH=`(pwd)`

echo "Iniciando microservicios..."

#Init...

echo "PATH: ${ACTUAL_PATH}"
DEPLOY_FOLDER="${SCRIPT_DIR}/../deploy/"

# Deploy de helloWorld
#******************************************************************************
rm -rf "${DEPLOY_FOLDER}"
mkdir "${DEPLOY_FOLDER}"

echo -e "\t  HelloWorld..."
MICROSERVICE_FOLDER="${SCRIPT_DIR}/../src/microservices/helloWorld"
cd "${MICROSERVICE_FOLDER}"
cp ${MICROSERVICE_FOLDER}/docker/* "${DEPLOY_FOLDER}"
cp "${MICROSERVICE_FOLDER}/config.cfg" "${DEPLOY_FOLDER}"
cp ${MICROSERVICE_FOLDER}/*.py "${DEPLOY_FOLDER}"

cd "${DEPLOY_FOLDER}"
# Mando construir la imagen.
./build.sh
# ejecuto el contenedor.
./run.sh
cd ${ACTUAL_PATH}

# Deploy de autenticacion
#******************************************************************************

rm -rf "${DEPLOY_FOLDER}"
mkdir "${DEPLOY_FOLDER}"

echo -e "\t  Autenticacion..."
MICROSERVICE_FOLDER="${SCRIPT_DIR}/../src/microservices/autenticacion"
cd "${MICROSERVICE_FOLDER}"
cp ${MICROSERVICE_FOLDER}/docker/* "${DEPLOY_FOLDER}"
cp "${MICROSERVICE_FOLDER}/config.cfg" "${DEPLOY_FOLDER}"
cp ${MICROSERVICE_FOLDER}/*.py "${DEPLOY_FOLDER}"

cd "${DEPLOY_FOLDER}"
# Mando construir la imagen.
./build.sh
# ejecuto el contenedor.
./run.sh

cd ${ACTUAL_PATH}