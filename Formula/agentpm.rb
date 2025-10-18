class Agentpm < Formula
  desc "AgentPM CLI"
  homepage "https://github.com/agentpm-dev/cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.6/agentpm-aarch64-apple-darwin.tar.gz"
      sha256 "c9cca127d5350611f3fa6eb14a8c01974ddc65303783dee7266f8248d4a2ec20"
    else
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.6/agentpm-x86_64-apple-darwin.tar.gz"
      sha256 "74ae6cccfd30918e98861d4128bdd20a11b55580d941e7c374b202168b0f7a6b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/agentpm-dev/cli/releases/download/v0.1.6/agentpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64a320ee329db683166ac327563313122d467241981d0244928c6012f693e20a"
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
