class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.29/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "40da0ff422572e0ed16dde1dded069f06b0c22afe99be83b9e374493397489ef"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.29/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "3512743b45674e06f7370c4f26d2304f49242225e059dc48cf2f161ec664e2cd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.29/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2eb8cb715826d875a14654f079ae9e4843261a0bb9d29b1702eb736615a4d8a7"
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
