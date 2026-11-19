class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.45/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "aee1f7e23b3dce7bda34ab2008ef75c6baca772eee80f06feb3c317a0c283551"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.45/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "2811af0c6e06012d4c54e109ca56873e4b30cd4f7cc9ffe07917ab03a0dbf2bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.45/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28cbf85c6b436e0c6d168b3557c429a7359fe6154f92d4d374ff436fc60d9eec"
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
