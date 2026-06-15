# typed: false
# frozen_string_literal: true

class Argusred < Formula
  desc "ArgusRed security scanner — automated security audit and pen-test agent"
  homepage "https://argusred.com"
  version "ARGUSRED_VERSION"

  on_macos do
    if Hardware::CPU.arm?
      url "https://software.argusred.com/cli/ARGUSRED_VERSION/argusred-darwin-arm64.tar.gz"
      sha256 "ARGUSRED_SHA256_DARWIN_ARM64"
      def install
        bin.install "argusred"
      end
    end
    if Hardware::CPU.intel?
      url "https://software.argusred.com/cli/ARGUSRED_VERSION/argusred-darwin-amd64.tar.gz"
      sha256 "ARGUSRED_SHA256_DARWIN_AMD64"
      def install
        bin.install "argusred"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://software.argusred.com/cli/ARGUSRED_VERSION/argusred-linux-arm64.tar.gz"
      sha256 "ARGUSRED_SHA256_LINUX_ARM64"
      def install
        bin.install "argusred"
      end
    end
    if Hardware::CPU.intel?
      url "https://software.argusred.com/cli/ARGUSRED_VERSION/argusred-linux-amd64.tar.gz"
      sha256 "ARGUSRED_SHA256_LINUX_AMD64"
      def install
        bin.install "argusred"
      end
    end
  end

  test do
    assert_match "ArgusRed", shell_output("#{bin}/argusred --help")
  end
end
