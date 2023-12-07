#!/bin/sh

# Requires install of Python3 header files and static libraries
# Requires install of `rust`
# Requires install of `cargo`
# Requires install of `gcc`

# Batch install virtual environments for PIP3 applications
# List of Python packages to install
packages=(
  babelfont
  fez-language
  fontmake
  fonttools
  gftools
  trafilatura
  urlscan
)

# Directory to create virtual environments
venv_dir="$HOME/.local/virtualenv"

# Create virtual environments and install packages
for package in "${packages[@]}"; do

  # Generate a unique name for the virtual environment
  venv_name="${package}"

  # Delete existing installations if they exist
  if [ -d "$HOME/.local/virtualenv/${venv_name}" ] ; then
    rm -rf "$HOME/.local/virtualenv/${venv_name}"
  fi

  # Create the virtual environment
  python3 -m venv "${venv_dir}/${venv_name}/venv"

  # Activate the virtual environment
  source "${venv_dir}/${venv_name}/venv/bin/activate"

  # Install the package using pip
  pip3 install --upgrade pip
  pip3 install wheel
  pip3 install "${package}"

  # Deactivate the virtual environment
  deactivate
done

# Checks if the `bin` directory exists, if not it creates it.
if [ ! -d "bin" ]; then
  mkdir -p "bin"
  chmod -R 755 "bin"
fi

# Link the binaries to the local bin (must add to $PATH)
# FontTools
ln -sf ~/.local/virtualenv/fonttools/venv/bin/fonttools ~/.local/bin
ln -sf ~/.local/virtualenv/fonttools/venv/bin/ttx ~/.local/bin
ln -sf ~/.local/virtualenv/fonttools/venv/bin/pyftsubset ~/.local/bin
ln -sf ~/.local/virtualenv/fonttools/venv/bin/pyftmerge ~/.local/bin
ln -sf ~/.local/virtualenv/fonttools/venv/bin/pyftsubset ~/.local/bin/

# FontMake
ln -sf ~/.local/virtualenv/fontmake/venv/bin/fontmake ~/.local/bin/

# Babelfont
ln -sf ~/.local/virtualenv/babelfont/venv/bin/babelfont ~/.local/bin/

# Fez
ln -sf ~/.local/virtualenv/fez-language/venv/bin/cu2qu ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/glyphs2ufo ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/fez2fea ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/ff-shape ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/mergefez ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/otf2fea ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/siesta ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/txt2fea ~/.local/bin/
ln -sf ~/.local/virtualenv/fez-language/venv/bin/ufo2glyphs ~/.local/bin/

# Google Fonts Tools
ln -sf ~/.local/virtualenv/gftools/venv/bin/gftools ~/.local/bin/

# URLscan
ln -sf ~/.local/virtualenv/urlscan/venv/bin/urlscan ~/.local/bin/

# Trafilatura
ln -sf ~/.local/virtualenv/trafilatura/venv/bin/trafilatura ~/.local/bin/

# EOF
