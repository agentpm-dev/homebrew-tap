class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.8/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "309f64f33d60390fbeb8cfa7881ca0b6f55a5fb72e3d831c15128989a8a7e5d9"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.8/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "0798bc1042e9ac35454e10fa89c115ae583460acdf0d69fbf8f1e8dceeb9bc03"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.8/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0109541bf1e68cac8a99e563980d78cdfbff615cc449b577c413374b4064d40d"
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
