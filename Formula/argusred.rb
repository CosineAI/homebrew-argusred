# typed: false
# frozen_string_literal: true

# ArgusRed Homebrew formula.
#
# MVP: macOS arm64 (Apple Silicon) only. Linux and Intel macOS bottles, plus
# code-signing / notarization, are deferred — see the homebrew-argusred README.
#
# The version and sha256 placeholders below are rewritten by the release
# workflow's update-tap job (CosineAI/argusred .github/workflows/release.yml).
class Argusred < Formula
  desc "ArgusRed security scanner — automated security audit and pen-test agent"
  homepage "https://argusred.com"
  version "ARGUSRED_VERSION"

  on_macos do
    if Hardware::CPU.arm?
      url "https://software.cosine.sh/argusred/release/ARGUSRED_VERSION/argusred-darwin-arm64.tar.gz"
      sha256 "ARGUSRED_SHA256_DARWIN_ARM64"

      def install
        bin.install "argusred"
        # The MVP binary is not yet notarized, so macOS Gatekeeper quarantines
        # it on download. Strip the attribute so `argusred` runs without a
        # security prompt. (Removed once builds are signed + notarized.)
        system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/argusred"
      end
    end
  end

  def caveats
    <<~EOS
      ArgusRed requires a license key:
        export ARGUSRED_LICENSE_KEY=your_key_here
      Then run:
        argusred

      This build targets Apple Silicon (arm64). Intel macOS, Linux, and signed
      builds are coming soon.
    EOS
  end

  test do
    assert_match "ArgusRed", shell_output("#{bin}/argusred --help")
  end
end
