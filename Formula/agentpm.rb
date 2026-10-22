class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.36/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "1a64c31c1bfecb4e7692599d4cbf9c949343e22566f6eb059135775c84ea590c"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.36/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "8f66f147865db910fcf99f6cf60c640c1e1cc3dccf307459285cce6692587f13"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.36/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6ae938dee91d6e35a1de9180ba4383bb6bbcd92a27b068d12db30ff737534ce"
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
