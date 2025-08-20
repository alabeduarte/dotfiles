#!/bin/bash

set -euo pipefail

BASEDIR=$(cd "$(dirname "$0")" && pwd)
GPG_DIR="$HOME/.gnupg"
GPG_AGENT_CONF="$GPG_DIR/gpg-agent.conf"

disable_keychain() {
  echo "Disabling keychain storage for pinentry-mac..."
  defaults write org.gpgtools.common DisableKeychain -bool yes
  echo "Restarting GPG components..."
  gpgconf --kill gpg-agent
  killall pinentry-mac 2>/dev/null || true
  gpg-agent --daemon 2>/dev/null || true
  echo "Keychain storage disabled successfully!"
}

install() {
  echo "Installing GPG configuration..."

  # Check if pinentry-mac is installed, install it if not
  if ! command -v pinentry-mac >/dev/null 2>&1; then
    echo "pinentry-mac not found. Installing via homebrew..."
    brew install pinentry-mac
  fi

  # Disable keychain storage for pinentry-mac (security preference)
  disable_keychain

  # Create GPG directory if it doesn't exist
  if [ ! -d "$GPG_DIR" ]; then
    echo "Creating GPG directory..."
    mkdir -p "$GPG_DIR"
    chmod 700 "$GPG_DIR"
  fi

  # Create or update gpg-agent.conf
  echo "Configuring gpg-agent to use pinentry-mac..."
  cat >"$GPG_AGENT_CONF" <<EOF
# Use pinentry-mac for passphrase entry
pinentry-program /opt/homebrew/bin/pinentry-mac

# Cache passphrases for 1 hour
default-cache-ttl 3600
max-cache-ttl 3600

# Set 30-second timeout for pinentry prompts
pinentry-timeout 30
EOF

  # Set proper permissions
  chmod 600 "$GPG_AGENT_CONF"

  # Restart gpg-agent to apply new configuration
  echo "Restarting gpg-agent..."
  gpgconf --kill gpg-agent
  gpg-agent --daemon 2>/dev/null || true

  echo "GPG configuration installed successfully!"
  echo "Note: Make sure 'export GPG_TTY=\$(tty)' is in your shell configuration."
}

uninstall() {
  echo "Uninstalling GPG configuration..."

  if [ -f "$GPG_AGENT_CONF" ]; then
    echo "Removing gpg-agent.conf..."
    rm -f "$GPG_AGENT_CONF"

    # Restart gpg-agent to revert to defaults
    echo "Restarting gpg-agent with default configuration..."
    gpgconf --kill gpg-agent
    gpg-agent --daemon 2>/dev/null || true

    echo "GPG configuration removed successfully!"
  else
    echo "No GPG configuration found to remove."
  fi
}

# Main execution
case "${1:-install}" in
install)
  install
  ;;
uninstall)
  uninstall
  ;;
disable-keychain)
  disable_keychain
  ;;
*)
  echo "Usage: $0 [install|uninstall|disable-keychain]"
  exit 1
  ;;
esac

