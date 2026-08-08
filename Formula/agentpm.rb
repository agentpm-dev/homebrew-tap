class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.21/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "a48547bd4add178cbdd29981152b0d1dc43cce5c211da1aa2094d47ccdfd71b7"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.21/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "5fd8fa66a16b8d0fe8cd9e1be56a829bf71c168796c31507d0ed1b0c5b0940a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.21/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e93c442328bbb098810da14ff75f307d2598706ae5fc81fecd183d083950e908"
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
