class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.5.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.5.2/hoplite_3.5.2_darwin_arm64.tar.gz"
      sha256 "4885bd6ff9a6f70cd56e4cba1bc8a6e88a421236da7226ab724fee2846806520"
    else
      url "https://hoplite.sh/downloads/releases/3.5.2/hoplite_3.5.2_darwin_amd64.tar.gz"
      sha256 "bc75655d15ec4947fe9365d2f7782703082b9200dfb1f7992e4ad47516eee066"
    end
  end

  def install
    # `hoplite` runs `hoplite-legacy` for the commands it has not ported yet.
    bin.install "hoplite", "hoplite-legacy"
    bin.install_symlink "hoplite" => "hplt"
    (share/"doc/hoplite/third_party").install Dir["third_party/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hoplite --version")
    assert_match version.to_s, shell_output("#{bin}/hoplite-legacy version")
  end
end
