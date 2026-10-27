class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.39/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "90ac47c137cba694925e850d5bb8b2fbd3ec06596ea0f81059b0614b8445ba1d"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.39/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "8e5b6acd9ac13af86a581993ed03fe6f2841cde88df4971f4b64f9242fea078e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.39/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1888788889f17d038f452e52e445843ac67791e761880660baf1042dee78d99"
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
