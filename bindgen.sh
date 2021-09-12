#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function exit_if_last_command_failed() {
    error=$?
    if [ $error -ne 0 ]; then
        exit $error
    fi
}

function download_C2CS_ubuntu() {
    if [ ! -f "./C2CS" ]; then
        wget https://nightly.link/lithiumtoast/c2cs/workflows/build-test-deploy/develop/ubuntu.20.04-x64.zip
        unzip ./ubuntu.20.04-x64.zip
        rm ./ubuntu.20.04-x64.zip
        chmod +x ./C2CS
    fi
}

function download_C2CS_osx() {
    if [ ! -f "./C2CS" ]; then
        wget https://nightly.link/lithiumtoast/c2cs/workflows/build-test-deploy/develop/osx-x64.zip
        unzip ./osx-x64.zip
        rm ./osx-x64.zip
        chmod +x ./C2CS
    fi
}

function bindgen {
    ./C2CS ast -i $DIR/src/c/FAudio/FAudio_bindgen.h -o $DIR/ast/FAudio.json -s $DIR/ext/FAudio/include
    exit_if_last_command_failed
    ./C2CS cs -i $DIR/ast/FAudio.json -o $DIR/src/cs/production/FAudio-cs/FAudio.cs -l "FAudio" -c "_FAudio"
    exit_if_last_command_failed
}

unamestr="$(uname | tr '[:upper:]' '[:lower:]')"
if [[ "$unamestr" == "linux" ]]; then
    download_C2CS_ubuntu
    bindgen
elif [[ "$unamestr" == "darwin" ]]; then
    download_C2CS_osx
    bindgen
else
    echo "Unknown platform: '$unamestr'."
fi
