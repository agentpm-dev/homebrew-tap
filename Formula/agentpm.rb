class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.37/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "4e8d5c3b37f7f8b1f739c1f84ef29b557ecdf409bc02f068bb147be4c1c74ab0"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.37/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "cb38b1ed308e28754dec0bf050d2a33905f6c392ad719258bbbbf3f68df61cf1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.37/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92e93f33d544d8d4a6e985fd22c795178b83e4e66e5a7203178f58a98f13eedc"
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
