class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.13/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "15209e3d70a8176faa003cf0bac0e7f2e098e62c1dd93cbca4509beea2ae8d81"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.13/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "f6181e9b779b262168f6af07225506380f273a3b86b8d7dd486355f13d3271b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.13/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3eac417008dd4df75d7e136fe12446f7df729f2fd5e07a81455e081d158833b3"
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
