class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.38/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "3b789b7e512876223e0c2d8989de863273ba247a05fb6097f709a0782a5e7a9a"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.38/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "e91f10ccd2d80f23ae3ecdafd1f12df0474f356a299c933e99b4e576181ccf58"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.38/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9bb10236059198169cc292a532259d9385c787ed52985ebfa99aae5d83b82f5b"
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
