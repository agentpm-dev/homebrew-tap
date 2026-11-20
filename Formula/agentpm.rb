class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.46/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "15c603bb072472ae683971b586f5c2be0ee5d3844f5d409d3c88ff36eff83a9e"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.46/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "80eed779141e90371d85c4eacb98a515998bb42207599e1744bcda7c20d5c856"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.46/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c6c8d91aa3abcc0aaf04f44ff5dabcf602f09f8dec2c634cf8d7d67792e2911"
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
