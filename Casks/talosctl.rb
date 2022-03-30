# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.0.0"

  if Hardware::CPU.intel?
    sha256 "cc460ba5347f11b1baa793729a9d475311c525f29be0edeb3d486816b4e15f9a"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "ac62572ae5cd71a02ccbb91ef14edc4970a468f4595adeca93e66dea74b03bbd"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"
end
