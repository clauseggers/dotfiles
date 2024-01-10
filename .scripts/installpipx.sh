#!/bin/sh

# Batch install Python applications in virtual environments

# Requires install of `pipx` which
# Requires install of `pip` which
# Requires install of Python

# List of Python packages to install
packages=(
  babelfont
  fez-language
  fontmake
  fonttools
  gftools
  trafilatura
  urlscan
  sncli
  visidata
  ruff-lsp
)

# Update `pip`
pip3 install --upgrade pip
pip3 install wheel

# Iterate the installation of the listed packages
for package in "${packages[@]}"; do

  # Install each package using `pipx`
  pipx install "${package}"

done

# EOF
