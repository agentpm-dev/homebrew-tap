class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.41/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "44419a4c6c127938cb2541a36ec6733987a7ed4d532dc6f6e979095eda76d78c"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.41/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "5dba2990d120f46b93e8ac40543ee8712c7da66543a3926730b8e25cc7ae5624"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.41/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c901456dce51f538f44180ef1ab882b72a4481d6cad54b5469280fd3d1ecdef"
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
