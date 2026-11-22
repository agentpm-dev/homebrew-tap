class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.47/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "de98d238f2396229d21c365c5fc1f8a135e86c368fc8c6f8a9e141cb93d8ff87"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.47/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "3bd33284c27514b8383c7a64775689dd03cacaeb27665692d5179650316fcd36"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.47/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "24da4464a554c3654828e4654dedb04b110c938d029febf0bd2e9f6deffbac5e"
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
