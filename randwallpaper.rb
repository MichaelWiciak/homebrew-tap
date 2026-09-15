class Randwallpaper < Formula
  desc "Generate unique, procedural wallpapers using masks, paths, and colourmaps"
  homepage "https://github.com/MichaelWiciak/randwallpaper"
  url "https://github.com/MichaelWiciak/randwallpaper/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "634f1a14c8542a26bb31b02e0ba0d18caa7fcdf0ab616b9489e901fb5a27e130"
  license "MIT"
  head "https://github.com/MichaelWiciak/randwallpaper.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/randwallpaper"
  end

  test do
    assert_match "dev", shell_output("#{bin}/randwallpaper -version 2>&1")
  end
end
