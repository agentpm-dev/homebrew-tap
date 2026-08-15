class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.22/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "6022bb1820116a786d59693e580e886e7af828b8506908eaa031d46e650ac567"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.22/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "8a2b2fa043e208fb60b14f65f03df2c8526b220e890f9760aff3e87e072dd734"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.22/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2e16b5a1ba03bc1d39aba12d43deac1ca69581d3b2f31770deb917f8c07511e"
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
