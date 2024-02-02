#!/usr/bin/env sh

BINARY=/opzd/${BINARY:-cosmovisor}
ID=${ID:-0}
LOG=${LOG:-opzd.log}

if ! [ -f "${BINARY}" ]; then
	echo "The binary $(basename "${BINARY}") cannot be found. Please add the binary to the shared folder. Please use the BINARY environment variable if the name of the binary is not 'opzd'"
	exit 1
fi

BINARY_CHECK="$(file "$BINARY" | grep 'ELF 64-bit LSB executable, x86-64')"

if [ -z "${BINARY_CHECK}" ]; then
	echo "Binary needs to be OS linux, ARCH amd64"
	exit 1
fi

export OPZDHOME="/opzd/node${ID}/opzd"

if [ -d "$(dirname "${OPZDHOME}"/"${LOG}")" ]; then
    "${BINARY}" run "$@" --home "${OPZDHOME}" | tee "${OPZDHOME}/${LOG}"
else
    "${BINARY}" run "$@" --home "${OPZDHOME}"
fi