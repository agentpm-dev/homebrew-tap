class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.5/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "f51f5767a88eed91cee26d9b08a5415df230ab5ddff5cb92e05250505781ba30"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.5/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "59c4d2d4ec9425aaec0f0b7e78581a476922cf9e31843345377cc611b7021c8f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.5/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a557342c1911d83fce9c55def697584bce77a246098e2b69560749e1721fc62b"
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
