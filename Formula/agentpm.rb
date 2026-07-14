class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.19/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "7f1284230ff47c82c83ff896cea8201f66740f8b5cb5e2a1414b0ebf651c664d"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.19/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "5456bf17adb91e3cfd7e532ed62194ad297fa7fb27d74103520f92f7f34822dc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.19/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "853e23ca29404f461428fe5f746f4575612008eef1aa272ca12be12ae5189469"
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
