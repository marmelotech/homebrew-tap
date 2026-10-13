class ShepherdCli < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.14.1/shepherd-macos-arm64.tar.gz"
      sha256 "6f61f0ae269fc7b38b7a2383c28e97254ecfa425c97f84dea4fee3569c4ad5b3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.14.1/shepherd-linux-x64.tar.gz"
      sha256 "5af578db2ecceda1ee2d0836325b7847b52c9efc8b593ee32ea31a7fe62dc135"
    end
  end

  def install
    libexec.install Dir["*"]
    # Link bin/shepherd, not the copy at the top of the archive: the executable
    # finds its native libraries (SQLite, used by RAG) in ../lib, which only
    # resolves for libexec/bin/shepherd.
    bin.install_symlink libexec/"bin/shepherd"
  end

  test do
    assert_match "Shepherd version: ", shell_output("#{bin}/shepherd version")
  end
end
