class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.44/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "beeb2416e75af751ebd52cfd29243e71289997d634c93c1342fe33e766bd845d"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.44/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "f01e197c2550bc20f56c576e6dc4f6105a92490af669cdc82486fa2bf55ed810"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.44/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "037e861a92d388a61dad17830b196a6c0360eed0fbce7bfc2e6f6b807b4dbea0"
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
