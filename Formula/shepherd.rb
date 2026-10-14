class Shepherd < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.15.1/shepherd-macos-arm64.tar.gz"
      sha256 "f699eeddafec50bec209e175969ff7739698d45f3dc32b767b5605379de27e4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.15.1/shepherd-linux-x64.tar.gz"
      sha256 "f8d5ee752afad09c72674aa1da3af7704d729a0956733330052705a9721b90b3"
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
