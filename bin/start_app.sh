#!/bin/env bash

# Obtengo la carpeta del script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ACTUAL_PATH=`(pwd)`

echo "Iniciando microservicios..."

echo "PATH: ${ACTUAL_PATH}"
echo -e "\t  HelloWorld..."
cd "${SCRIPT_DIR}/../src/microservices/helloWorld"
./build.sh
./run.sh &


cd ${ACTUAL_PATH}

# Construyo la imagen...
#docker build -t uoc-helloworld ${SCRIPT_DIR}/../src/microservices/helloWorld/
# Ejecuto el contenedor indicandole el mapeo de puertos.
#docker run -p 2202:2202 uoc-helloworld

