class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.25/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "f208ad7e935955ccda55898e746b947dca7e9990f26cb9c6b5b569efb0882879"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.25/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "c4aed9d5a5e5aaa56e20fd0f5f4b38d90c5f735d80ab8396f2cb4588a2ee4f3a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.25/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b863a9acc5124fc981f6e7621997c38596b2f2b228bfc4b3b9299bc900073f5"
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
