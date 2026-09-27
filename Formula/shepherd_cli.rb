class ShepherdCli < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.12.1/shepherd-macos-arm64.tar.gz"
      sha256 "3bcd27692e0447319b372167a1d926eb997ff11764d43ed7081071b155e4d12d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.12.1/shepherd-linux-x64.tar.gz"
      sha256 "4ce5dd12bcf194ea15ba02f54b73a79b2618171579c1db21ee6c64cbee868276"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"shepherd"
  end

  test do
    assert_match "shepherd", shell_output("#{bin}/shepherd --version")
  end
end
