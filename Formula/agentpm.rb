class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.3/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "4c092a2a6228e7e85be8499a2bd090a9441f42a0eb7aaf8f086826f19ffa1c22"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.3/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "41412a459516922cdd54af8d3ba21e396141c4d56656e7162e2f6a0f25a1bef8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.3/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27657f2850fa5240db8c1e5607289c5c76da0b3b620b8c2ae3f13e3bfde5b1db"
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
