class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.17/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "ea31a29cd60948fd1ac8d4cc55988904d397c427a11efad00d5c088ffe43d6d6"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.17/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "3ee953481f87c51b2a91d0dfd74754e28e2ac3c8b37e93ee792e1bb89a338b6f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.17/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4fcc3849af23124333cbdaa2fa89dd31d64acab63d2a827974f74c43f0e8a3b"
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
