class ShepherdCli < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.13.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.13.6/shepherd-macos-arm64.tar.gz"
      sha256 "8a645f554438d63d16d7369c02736ba5362fd1c31e4da042c0345a7c49b6a8e8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.13.6/shepherd-linux-x64.tar.gz"
      sha256 "c2ba5953ead24f5070aa944f0e5e32c4c465d7599006167eb7f49dc7245f1320"
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
