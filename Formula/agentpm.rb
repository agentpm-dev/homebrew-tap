class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.26/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "3df640a1662fb41c124d3625c00dc24d9f887b20376e90ab4f3d2ebfa6bbd9db"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.26/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "f77287d249aa2ee69c789e06d5d3d203e60b7e9090bb75ab43a0f52db8e3078c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.26/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3a50cf62c78886667af16cfcb4eb21fc9e259c8612081eed5dc13d446194581"
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
