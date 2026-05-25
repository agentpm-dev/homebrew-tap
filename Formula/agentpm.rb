class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.14/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "786a6e76bbed7472439694540f6dc644ab6cafddc4b6397d2ef51c6dcbf7342e"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.14/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "68c00811d2553f2142932373b97a43ef2f9fcb7841ba695173e3bc0639b41857"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.14/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "429944409bc3a6f947cb9bc04255a681321c6739d99e511420260e3af3fae854"
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
