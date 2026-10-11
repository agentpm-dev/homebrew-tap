class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.34/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "d8cddae2062df3e4b9b191f93bc7139a5841dec91daa42d4d15accf1a754bc67"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.34/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "0a0ca3af5b344a0c8516a753fe4270a8b1ae054572a01c34f8157b53bd4f386d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.34/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf67d1accb46192f7c41f6892106fdd087cae3982ce01ab76a2571f3687a12d0"
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
