class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.27/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "b33ddd898d1a4b0613560e65f6b2c451cd8a4a5fa6e4a68c70c251d148ade74b"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.27/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "59377b4080de1cf20c98335153fab1fcceb137776b0dfe6e8ddf2e1f34ee6fe3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.27/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77f234d90ef99121f80fafb37ab087c9980a4e2b3b63bb4ae8647d4b61ac6ea4"
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
