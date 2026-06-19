class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.16/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "959e03ecf9497ba908c4755c457c383e3f66a335861560798db6d321a4ee7405"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.16/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "148671915ab736eaec2a644a6e08a0053e245bed835b4e1f535ce3d0ef5dc1ed"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.16/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e58658ff1da9a4630e5ae8f3541d7550e492a1d1726326f0fc2f4ad31e9224b"
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
