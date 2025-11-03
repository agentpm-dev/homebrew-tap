class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.10/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "af80b2c3eb20531f1419777308498aedac732efc1ae03d1227d750be25abcc1e"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.10/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "cc1fc295172a2a7531922a5064ac98fb3b27f98ff275d1ca51c2d824ea988a10"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.10/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a02227f33bd00bf12c26d1a6cf801b9466ec6b56b1e5e45fe715807369200201"
    else
      odie "Unsupported architecture"
    end
  end

  def install
    bin.install "agentpm"
  end

  test do
    output = shell_output("#{bin}/agentpm --version")
    assert_match "agentpm", output
  end
end
