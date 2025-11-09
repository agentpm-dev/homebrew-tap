class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.12/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "20301b85ef84e5505d38e858ac3e55cdf3c5b919daa34ea87fba32646469a773"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.12/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "97480d9b9a6ad6b21616a8e2a43947d37f4b41ecf958abe04378a52e262806ce"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.12/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d31cf24a78c0f71ce8ac6a9cd7059629ed788a3ee91e3e48c2f8dd7f93bca64"
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
