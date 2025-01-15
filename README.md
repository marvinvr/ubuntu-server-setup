# Ubuntu Server Setup

My personal setup script for new Ubuntu machines. This script automatically configures a fresh Ubuntu installation with my preferred settings and tools.

## What it does

- Sets up ZSH as the default shell
  - Installs Oh-My-ZSH with a custom theme
  - Configures auto-suggestions plugin
  - Enables automatic updates
- Installs and configures Tailscale for VPN connectivity
  - Sets up with automatic DNS configuration

## Usage

You can run this setup with a single command:

```bash
curl -fsSL setup.marvinvr.ch | bash
```

Alternatively, you can clone this repository and run the setup script manually:

```bash
git clone https://github.com/marvinvr/ubuntu-server-setup.git
cd ubuntu-server-setup
./setup.sh
```

## Note

This script is designed for my personal use and preferences. Feel free to fork and modify it according to your needs.

## License

MIT
