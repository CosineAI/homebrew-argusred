# homebrew-argusred

Homebrew tap for [ArgusRed](https://argusred.com) — automated security audit and pen-test agent.

> Availability: macOS on Apple Silicon (arm64) and Linux (amd64/arm64). Intel
> macOS, Windows, and signed builds are coming soon.

## Install

Recommended — one-line installer (plain HTTPS, no Homebrew required):

```bash
curl -fsSL https://raw.githubusercontent.com/CosineAI/argusred-dist/main/install.sh | sh
```

Or with Homebrew:

```bash
brew install CosineAI/argusred/argusred
```

Then run:

```bash
argusred
```

On first launch ArgusRed opens your browser to sign in with Cosine. Once signed
in, scans run against your Cosine account — there is no separate key to set.

> Note: the Homebrew install taps this repo via `git`, so on machines that have
> GitHub credentials saved in the macOS keychain you may see a one-time
> "git-credential-osxkeychain wants to use your confidential information"
> prompt. That is macOS/git unlocking your existing GitHub login to clone the
> public tap — not ArgusRed accessing anything. It is safe to Allow, and the
> tap/dist repos are public so the install works even if you Deny. The curl
> installer above avoids this prompt entirely (it uses no `git`).

## Update

The curl installer is idempotent — re-run it to update:

```bash
curl -fsSL https://raw.githubusercontent.com/CosineAI/argusred-dist/main/install.sh | sh
```

Or with Homebrew:

```bash
brew update && brew upgrade argusred
```

## Uninstall

```bash
brew uninstall argusred
brew untap CosineAI/argusred
```
