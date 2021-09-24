#!/usr/bin/env bash
#

set -uo pipefail

if [ -z "${BASH_SOURCE[0]:-}" ]; then
  # zsh
  CONFIG_NVIM_DIR="${0:A:h}"
else
  CONFIG_NVIM_DIR="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
fi

SNAPSHOT_NAME="${1}"

PACKER_CACHE_DIR="${HOME}/.cache/nvim/packer.nvim"

mv_cmd="$(mv "${PACKER_CACHE_DIR}/${SNAPSHOT_NAME}" "${CONFIG_NVIM_DIR}/snapshots/" 2>&1)"

if [[ "${mv_cmd}" =~ .*are[[:space]]the[[:space:]]same[[:space:]]file.* ]]; then
  echo "${mv_cmd}"
  rm "${PACKER_CACHE_DIR}/${SNAPSHOT_NAME}"
fi

echo "linking:${CONFIG_NVIM_DIR}/snapshots/${SNAPSHOT_NAME} => ${PACKER_CACHE_DIR}/${SNAPSHOT_NAME}"
ln -nfs "${CONFIG_NVIM_DIR}/snapshots/${SNAPSHOT_NAME}" "${PACKER_CACHE_DIR}/${SNAPSHOT_NAME}"
