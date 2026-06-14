#!/usr/bin/bash

set -euo pipefail

BASEDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)

chezmoi apply -S "$BASEDIR/dots" --force
