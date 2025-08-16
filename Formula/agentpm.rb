class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.1/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "99c732f1c37552b96b5817ddf799aaedd4e8bef460eabca603b11a75f436f7d5"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.1/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "4cb0833061c568315ef0685c9e5002243e1e871fc2b38b2c13c6775b298d78d1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.1/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2873153e5db2e8a518269abaa99fefb9e289ab82cb9a71091460e7b774578681"
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
