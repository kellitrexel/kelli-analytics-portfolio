set -euo pipefail
VER="${QUARTO_VERSION:-1.5.56}"
WORKDIR="$(mktemp -d)"

echo "Installing R..."
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends r-base

echo "Downloading Quarto ${VER}…"
curl -fsSL -o "${WORKDIR}/quarto.tgz" \
  "https://github.com/quarto-dev/quarto-cli/releases/download/v${VER}/quarto-${VER}-linux-amd64.tar.gz"

echo "Unpacking Quarto…"
tar -xzf "${WORKDIR}/quarto.tgz" -C "${WORKDIR}"
export PATH="${WORKDIR}/quarto-${VER}/bin:${PATH}"

echo "Quarto version:" && quarto --version
echo "R version:" && R --version | head -n1

echo "Rendering site…"
quarto render
