class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.30/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "af1c1419b1bede7c8dfb8d776c6ab70bd1dfb14ca2079da4d909030f2a68812d"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.30/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "a205b2e8ac05040b934872735cb7dc563fde7dffc00751ded57dacb196b6a8ab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.30/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc196cc2ce035215c8bc619a38d31842778cd29256abb5683a77ee8367df4b83"
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
