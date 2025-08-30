class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.2/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "d32c6748bcd3c167630890757223e00bf00014e579feccd521fd638a2d8ca9ef"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.2/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "24c3cc4602c95b949f9b91cf316c8bf773ed6a8e38414b79679a4fff38d3de6c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.2/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e6e65d91e0f2ae1db98b98e165cd29bdac173068a22b6df965eb44e01e22444"
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
