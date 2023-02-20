class Enshamir < Formula
  desc "A command line utility to encrypt a secret and use Shamir's Secret Sharing Scheme to split it into shares."
  homepage "https://github.com/ycdesu/enshamir"
  url "https://github.com/ycdesu/enshamir/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "69549ab289cf554b3cae26947c23845a4f8c9e0cdd8a2fc4250030efd0fb2a70"
  head "https://github.com/ycdesu/enshamir.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "enshamir", "./cmd/enshamir"
    bin.install "./enshamir"
  end

  test do
    assert_match "enshamir is a tool for encrypting and splitting secrets into shares", shell_output("#{bin}/enshamir help").strip
  end
end
