require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)

class Psysh < Formula
  desc "PsySH is a runtime developer console, interactive debugger & REPL for PHP"
  homepage "https://github.com/bobthecow/psysh"
  url "https://github.com/bobthecow/psysh/archive/v0.5.2.tar.gz"
  sha256 "66cc4ccb4ae864fca6a7e6bb4be7da60bb9d9227da8c9770cd7b4137acc92822"
  head "https://github.com/bobthecow/psysh.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "6e73a73ed4044c73dc69cb3726735c43ae50cf6316d22c428cd7332c2d5eef9e" => :el_capitan
    sha256 "ed7506d750201c29d165227e07c9e95aaaaddad52255178f8f0ba0c5c8e98943" => :yosemite
    sha256 "a8a3864a11801a8a47664dd5e68e51dfe7af7404941c71c1cbeb5622ebae28b1" => :mavericks
  end

  depends_on PhpMetaRequirement
  depends_on "composer" => :build
  depends_on "php53" if Formula["php53"].linked_keg.exist?
  depends_on "php54" if Formula["php54"].linked_keg.exist?
  depends_on "php55" if Formula["php55"].linked_keg.exist?
  depends_on "php56" if Formula["php56"].linked_keg.exist?
  depends_on "php70" if Formula["php70"].linked_keg.exist?

  def install
    system "composer", "install", "--no-dev"
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/psysh"
  end

  test do
    system "psysh", "--version"
  end
end