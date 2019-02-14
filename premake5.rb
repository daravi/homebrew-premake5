class Premake5 < Formula
  desc "Powerfully simple build configuration."
  homepage "https://premake.github.io/"
  url "https://github.com/premake/premake-core/releases/download/v5.0.0-alpha13/premake-5.0.0-alpha13-src.zip"
  sha256 "b28d2d1f4dc7efa8bdfe20d331787461a58a0da558adac0aef939ad006019209"
  version_scheme 1
  head "https://github.com/premake/premake-core.git"

  def install
    if build.head?
      system "make", "-f", "Bootstrap.mak", "osx"
      system "./premake5", "gmake"
    end

    system "make", "-C", "build/gmake.macosx"
    bin.install "bin/release/premake5"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/premake5 --version")
  end
end