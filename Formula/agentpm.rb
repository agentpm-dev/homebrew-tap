class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.35/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "d14fac265c51288d3cbeae60f2d2ca197bf7d241fd1bb4e142996df2eb3b6da4"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.35/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "e7955f742d6e78206d26ff073bb3fc8c21fda226c395141e8961d1169130ccdc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.35/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e9492ae17936dcfa34f05d56103f86e38f00da25c843e06534d414c8789d666"
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
