#!/usr/bin/env bash
set -e

echo "Configuring git..."
git config --global init.defaultBranch main
git config --global user.name "${GIT_NAME}"
git config --global user.email "${GIT_EMAIL}"
git config --global color.ui auto
