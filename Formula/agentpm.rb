class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.28/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "2174fb3d57722b76d8d553fefba300065e83db1e22ac15ed3e42b86ffc78489c"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.28/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "7d3340b413998bfbe17ee3d2f96b96b6f0d7f068728c57f16b3c145c2a946012"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.28/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d08109cc9e40708765bc878b0e94e2162683dd644902228079806cf6b3b34949"
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
