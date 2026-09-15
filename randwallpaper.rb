class Randwallpaper < Formula
  desc "Generate unique, procedural wallpapers using masks, paths, and colourmaps"
  homepage "https://github.com/MichaelWiciak/randwallpaper"
  url "https://github.com/MichaelWiciak/randwallpaper/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "67cbf0322e2f6e964a9fd85397c216cea67ba9e08f737d6362c7dffc2ef71081"
  license "MIT"
  head "https://github.com/MichaelWiciak/randwallpaper.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "./cmd/randwallpaper"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/randwallpaper -version 2>&1")
  end
end
