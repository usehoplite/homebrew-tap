class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.5.1/hoplite_3.5.1_darwin_arm64.tar.gz"
      sha256 "0d34a6a126499c4bb9acdc8551963a7be2cb6af7d463707ededc4e75c0cc2f80"
    else
      url "https://hoplite.sh/downloads/releases/3.5.1/hoplite_3.5.1_darwin_amd64.tar.gz"
      sha256 "51e8adf4a7bec78a425a02ef2237305509e1ba61d86552b5af1300b188da5a1f"
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
