class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.0/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "f54d957ca4808460e5f11f1aa67423e70a1f51986d42f46ba081c09097d21924"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.0/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "95c958b1eee645722eecdf971ad66accaef0e60d13d632793ab97746b471ae97"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.0/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fe1eebe60bbcd65884cf5c9a42100cada131872b3067d555af6ba280da24fe7"
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
