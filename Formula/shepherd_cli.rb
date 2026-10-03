class ShepherdCli < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.13.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.13.3/shepherd-macos-arm64.tar.gz"
      sha256 "b89509e0b708d36c81b6678fa4b4591383d89963a301b1448e7a5e1cd2f62e24"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.13.3/shepherd-linux-x64.tar.gz"
      sha256 "1b5b0289d3c37e06a252018e69b31a485687e81943ed64f3b963cf1412d15e86"
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
