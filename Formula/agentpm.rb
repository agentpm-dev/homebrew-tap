class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.24/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "5795449ba1427c4bb18cac64d680afb21e6e6fb379f45c018183b1b2fd142abb"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.24/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "d47de2709325670feaf81296386efcecb03a8f5ccbfcdc015ce04396e5ac49ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.24/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d05f486adb2541da582779d1e745b370e32aa42b97e385f6cf1a4b6c9033fef3"
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
