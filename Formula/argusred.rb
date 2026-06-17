# typed: false
# frozen_string_literal: true

# ArgusRed Homebrew formula.
#
# MVP: macOS arm64 (Apple Silicon) only. Linux and Intel macOS bottles, plus
# code-signing / notarization, are deferred — see the homebrew-argusred README.
#
# The ARGUSRED_VERSION (numeric, no leading "v") and ARGUSRED_SHA256_DARWIN_ARM64
# placeholders below are rewritten by the release workflow update-tap job
# (CosineAI/argusred). The version is set explicitly because Homebrew's
# auto-detection misparses GitHub releases/download/<tag>/ URLs.
class Argusred < Formula
  desc "Automated security audit and pen-test agent"
  homepage "https://argusred.com"
  url "https://github.com/CosineAI/argusred-dist/releases/download/v0.1.3/argusred-darwin-arm64.tar.gz"
  version "0.1.3"
  sha256 "7d4b11f6dd08809918fe342d73487ec780bb607ed6c93e3e1351295095780dfc"

  # MVP targets Apple Silicon macOS only.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  def install
    bin.install "argusred"
    # The MVP binary is not yet notarized, so macOS Gatekeeper quarantines it on
    # download. Strip the attribute so `argusred` runs without a security
    # prompt. (Removed once builds are signed + notarized.)
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"argusred"
  end

  def caveats
    <<~EOS
      Get started:
        argusred

      On first launch ArgusRed opens your browser to sign in with Cosine.

      This build targets Apple Silicon (arm64). Intel macOS, Linux, and signed
      builds are coming soon.
    EOS
  end

  test do
    assert_match "ArgusRed", shell_output("#{bin}/argusred --help")
  end
end
