class ShepherdCli < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.14.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.14.5/shepherd-macos-arm64.tar.gz"
      sha256 "7f96be30fe518398d0fd433169dc827b5a1787fa8a87b70325165fc40b67054b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.14.5/shepherd-linux-x64.tar.gz"
      sha256 "5a0528f6741b8fc635e20e25344b0d0a7c2fa181f1c20bffca94c7e8a22b9edf"
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
