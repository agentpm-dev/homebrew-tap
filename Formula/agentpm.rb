class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.42/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "88baf15ea0574d4f67dfd4d04a7da471fcfcf39f85c20a0bbb824e60090cda9a"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.42/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "fef05fd0c53e088b68a75a5023fd64edf418bc00d2227a8a779720313cf6a205"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.42/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "414b25bb9d1879c76c125c83f62f534457856af531c15b581d580b076d9a0af2"
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
