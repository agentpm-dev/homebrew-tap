class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.11/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "79af9b078d1018e0e2ef6af6cc2807479bfdb4edb6fccf77266f77b1ff0a6a4b"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.11/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "03c524d44890421bb5382dff844776b0786f449a95b885fbdb1ed889c5a58fb7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.11/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cff501676d56b9f76a568b9520bbbdeaaf0e13bef48ca36a110071cfc5cf6892"
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
