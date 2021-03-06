class Libqalculate < Formula
  desc "Library for Qalculate! program"
  homepage "https://qalculate.github.io/"
  url "https://github.com/Qalculate/libqalculate/releases/download/v3.7.0/libqalculate-3.7.0.tar.gz"
  sha256 "f1a3f2510133ed8d4b278058565d83d65c180025711a4dc7da8e242d8a5f8247"

  bottle do
    sha256 "a08afee195e0f848662ce5c555f1d25aed239f3c3f6223d08e4473de168c31c4" => :catalina
    sha256 "894cfa74226f7da56fba30ac44b8a8e2cc0b62e13c8adcf7518309dcac7741b1" => :mojave
    sha256 "31b223623a9c64b5e944aace7564c19165716b6f50481668979c7f31a13aaddc" => :high_sierra
  end

  depends_on "intltool" => :build
  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "gnuplot"
  depends_on "mpfr"
  depends_on "readline"

  def install
    ENV.cxx11
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-icu",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/qalc", "-nocurrencies", "(2+2)/4 hours to minutes"
  end
end
