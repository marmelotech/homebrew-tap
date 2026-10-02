class ShepherdCli < Formula
  desc "AI-native CLI automation and development engine for Dart & Shepherd Platform"
  homepage "https://shepherdplatform.com"
  version "0.12.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.12.24/shepherd-macos-arm64.tar.gz"
      sha256 "2412454813938e9d3d07d715a721429167276e340c19a65b598e0350c3c0dbc0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cruvinelrv/shepherd/releases/download/v0.12.24/shepherd-linux-x64.tar.gz"
      sha256 "ebf575fc505d4658b494b670921792f123011fa5e439d8d9be70ddd14e4cac32"
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
