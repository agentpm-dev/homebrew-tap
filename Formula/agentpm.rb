class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.33/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "f52bb2edeb3427b7927ec07915f1900fcb8f7c0ea3508f469eb23b85b1943ac4"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.33/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "3c394083450d41eae7a30d215fc1cf017d0a3c69530898a9478c6f2a6d80ba75"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.33/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff97542ed816ccc58f5e61f75705e76b5748b98beeb20e3f23321a77058e48a2"
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
