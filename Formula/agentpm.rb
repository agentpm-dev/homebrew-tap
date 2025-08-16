class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.1/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "7d9b0da605cb85d09e0df6150e37df9282369eb6be59e223b91e8b1b534ba8c5"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.1/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "717e93bd692b0af47952ee7d86a8983726d48855da7a4400bf64c43ee9dfe274"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.1/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f2a44716455d6cfbcb1f091320229ab7492d7f1f310dc9be285d2980aa639dd"
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
