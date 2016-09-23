#!/usr/bin/env sh

echo "DSA or RSA 1024 bits: Totally unsafe."
echo "RSA 2048: Too weak."
echo "RSA 3072/4096: Acceptable, but Ed25519 is faster."
echo "ECDSA: Recommended against."
echo "Ed25519: Recommended."
echo ""
echo "These are your keys"

# List your SSH-keys
for keyfile in ~/.ssh/id_*; do ssh-keygen -l -f "${keyfile}"; done | uniq

# Generate a new Ed25519 key
# ssh-keygen -o -a 100 -t ed25519

# Read more here
# https://blog.g3rt.nl/upgrade-your-ssh-keys.html
