class Sigilcli < Formula
  desc "Extract Apple system symbols as clean SVG vectors"
  homepage "https://github.com/dannolan/sigilcli"
  url "https://github.com/dannolan/sigilcli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d4f420852e4fdf6cbc50b4cb4243e5e6a62f5d7e500c112d24440d797ec553fb"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/sigil"
  end

  test do
    assert_match "star.fill", shell_output("#{bin}/sigil --list")
  end
end
