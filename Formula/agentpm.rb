class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.9/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "d5907d9f543dc293836394632a26a5402196bee1117340bcce451fd8b0136f31"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.9/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "32698f3a2ebe6bfaca6658d1f2b2cd28d1de6efe2ee55ed8b44d534541c96666"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.9/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d63e65349a316ce334a86b12c3bac00b0754679686842f38415a1add33ab5c42"
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
