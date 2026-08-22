class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.23/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "f8e01c1bdbec01eeb98fc0f06b36750b66a20eebe539d0497cb7a085783d08f7"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.23/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "746f62ea6ac1cd7c6c5a8be0d86d2581c905a7348524fea571efbc335f3f652f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.23/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f94deb3309ad4591ab07204299aeae446b751601593bd5746933d15142510fd2"
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
