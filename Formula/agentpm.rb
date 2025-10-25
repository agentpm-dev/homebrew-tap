class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.7/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "3351f9183199778309a1072166882855e9af8e1acde3c34e3836d99765616b94"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.7/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "7a5be58268b5cd860460f39cfd1ddc5efb7e12cf08ea3477045b422500f2e669"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.7/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a097699b3cf414b6c6f118ff06fa4e6ca34c13d842cd850f36716852d371c6b8"
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
