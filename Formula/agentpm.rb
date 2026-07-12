class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.18/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "c72e24af2d7302642bb37237d155914e1cd3a27e564fc1176591f19e420291d0"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.18/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "91f7cfc486ba2bb7aab37b09dadb6be38e4fb8d778487a926b8bce5c236d393e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.18/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6357cd478afd85fdf95e37b03793210b898cac9a7f3857a5c522da82def73d6a"
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
