set -e

# pick a Quarto version that works well on Netlify
export QUARTO_VERSION=1.5.56

echo "Downloading Quarto ${QUARTO_VERSION}..."
curl -fsSL -o quarto.tgz \
  https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz

echo "Unpacking Quarto..."
tar -xzf quarto.tgz

# add Quarto to PATH for this build
export PATH="$PWD/quarto-${QUARTO_VERSION}/bin:$PATH"

echo "Rendering site with Quarto..."
quarto --version
quarto render
