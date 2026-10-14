class Shepherd < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.14.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.14.2/shepherd-macos-arm64.tar.gz"
      sha256 "307b2aeb1965239a22da4c0503cbf8d2a200e890f3b39f31158ac88cfb69edf9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.14.2/shepherd-linux-x64.tar.gz"
      sha256 "6fc32f89c2f89052685006b01abc7fc9e11e41413b20bc5a70bce5c26b786e38"
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
