class Randwallpaper < Formula
  desc "Generate unique, procedural wallpapers using masks, paths, and colourmaps"
  homepage "https://github.com/MichaelWiciak/randwallpaper"
  url "https://github.com/MichaelWiciak/randwallpaper/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "5a45d0d6c18e4f340cd45756c7699f841e97f10b644e90ede2a6a7c26dd0fba0"
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
