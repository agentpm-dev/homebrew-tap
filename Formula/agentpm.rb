class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.32/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "0476373d7a6d096d7ffc0e0fe1bbb54fb9bfabda2762a0c1baac60efe2e9b4eb"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.32/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "2a87af01aed6a0f4698b30ea140bf67f1f614b152721e4c80228d7d5e6f044f6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.32/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c15313443d815e4b11d7e247b0d58b584751a0b4bb743bec744dbe61a71862d9"
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
