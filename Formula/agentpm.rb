class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.40/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "0ee8d308fefcce1b2530360f626ad44d3e9dfc81bddd7aa47063910d18e9f407"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.40/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "a452cc9638481382584ccf4b2957fcf9551c42fb8d0387a75369b3e363b083f7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.40/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4603df451a76189f3346be9bbdde66ef95680329b0bffeaa54cc29206ce71b5d"
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
