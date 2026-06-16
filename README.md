# homebrew-argusred

Homebrew tap for [ArgusRed](https://argusred.com) — automated security audit and pen-test agent.

> Availability: macOS on Apple Silicon (arm64). Intel macOS, Linux, and signed
> builds are coming soon.

## Install

```bash
brew install CosineAI/argusred/argusred
```

Then run:

```bash
argusred
```

On first launch ArgusRed opens your browser to sign in with Cosine. Once signed
in, scans run against your Cosine account — there is no separate key to set.

## Update

```bash
brew update && brew upgrade argusred
```

## Uninstall

```bash
brew uninstall argusred
brew untap CosineAI/argusred
```
