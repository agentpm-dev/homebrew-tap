class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.4/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "87a26bdcb4a38b680256ea55ec31cfed748b3218cecb3c393e16e3e413eb93c4"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.4/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "1323854340be08c5fb0382806d80d07369047cae01bcea1ee2a3197d07d49510"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.4/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e16ac387dead4ccc742d75bfeec9361d35845c70d2117901b06a0653045df9ae"
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
