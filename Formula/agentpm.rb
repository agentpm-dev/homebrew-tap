class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.20/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "8012675de4426a34e9919f23271432c516dc637cc414370fdb2ccd09d5a6811c"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.20/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "c456d355c3d53a45bfb1ea6ea41602311c949a78a81bba1354e472126dbaf9c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.20/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8950436dcd4264f5b9a110056c8e0414e43e589486ffe345d1d93061c38396ba"
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
