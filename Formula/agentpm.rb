class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.31/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "ddb84d88820fae9638c8aa3abc3652c361c31705ed3801122565187d5fca7543"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.31/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "1926b985083009c247d3862f82beb7b95c2aafd4de3c58be3fdca89611df45ec"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.31/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61e63e7c2d29a5913ca016231e1fbd5369ebf0e9e9c1f7e49e38acf5fac4ab5b"
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
