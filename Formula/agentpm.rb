class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.43/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "aa99e3a63411886dede71c4abd944f172385fc3d5210049fe5256c1ef514e62c"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.43/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "18f2cc87c8bf0aa21e71d4a1ae94a51d296bda370ab177e04752d2c0e2a9c8f5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.43/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f04db3de303ac09ce721a11e3c1599a6b1d60a1fc9c483a9b67a12c21baa1ae1"
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
