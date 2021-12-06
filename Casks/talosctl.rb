# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.13.4"

  if Hardware::CPU.intel?
    sha256 "b5b761ae92d5804f17c03ef29e8ccc03ffa7f5ddc28d7dd51038946fe04210cf"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "f3ee75cae98e57147e64376a236874cc76379836a63793b6fce53f84fdabc85b"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"
end
