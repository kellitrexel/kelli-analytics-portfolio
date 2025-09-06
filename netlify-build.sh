set -euo pipefail

VER="${QUARTO_VERSION:-1.5.56}"
WORKDIR="$(mktemp -d)"

echo "Downloading Quarto ${VER}…"
curl -fsSL -o "${WORKDIR}/quarto.tgz" \
  "https://github.com/quarto-dev/quarto-cli/releases/download/v${VER}/quarto-${VER}-linux-amd64.tar.gz"

echo "Unpacking Quarto…"
tar -xzf "${WORKDIR}/quarto.tgz" -C "${WORKDIR}"

# Add Quarto to PATH (kept OUTSIDE the repo)
export PATH="${WORKDIR}/quarto-${VER}/bin:${PATH}"

echo "Quarto version:"
quarto --version

echo "Rendering site…"
quarto render
