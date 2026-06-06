class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.15/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "3686113356b844b88353939a52cfec0ad990df98cd6dd6c5f7062b6e40248ac7"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.15/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "eb147f21e6b0ebb1ec37c159aa65996db0d789fa2d7a376de77a5242ac0d6924"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.15/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a04b2addb5817a4289ce038f575a09b59e94abd696ba35c73a2e03dc96153743"
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
