# homebrew-argusred

Homebrew tap for [ArgusRed](https://argusred.com) — automated security audit and pen-test agent.

> Availability: macOS on Apple Silicon (arm64). Intel macOS, Linux, and signed
> builds are coming soon.

## Install

```bash
brew tap CosineAI/argusred
brew install argusred
```

Then run:

```bash
argusred
```

Set your license key (required for full access):

```bash
export ARGUSRED_LICENSE_KEY=your_key_here
argusred
```

## Update

```bash
brew update && brew upgrade argusred
```

## Uninstall

```bash
brew uninstall argusred
brew untap CosineAI/argusred
```
