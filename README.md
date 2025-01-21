# Ubuntu Server Setup

My personal setup script for new Ubuntu machines. This script automatically configures a fresh Ubuntu installation with my preferred settings and tools.

## What it does

- Sets up ZSH as the default shell
  - Installs Oh-My-ZSH with a custom theme
  - Configures auto-suggestions plugin
  - Enables automatic updates
- Installs and configures Tailscale for VPN connectivity
  - Sets up with automatic DNS configuration
- Installs modern command-line tools:
  - bat (better cat with syntax highlighting)
  - eza (modern ls replacement)
  - btop (advanced system monitor)

## Usage

You can run this setup with a single command:

```bash
curl -fsSL setup.marvinvr.ch/run.sh | bash
```

Alternatively, you can clone this repository and run the setup script manually:

```bash
git clone https://github.com/marvinvr/ubuntu-server-setup.git
cd ubuntu-server-setup
./run.sh
```

### Partial Setup

You can also run the setup script for a single part. For example, to run the ZSH setup script:

```bash
curl -fsSL setup.marvinvr.ch/scripts/zsh.sh | bash
```

## Note

This script is designed for my personal use and preferences. Feel free to fork and modify it according to your needs.

## License

MIT
