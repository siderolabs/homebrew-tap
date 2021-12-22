# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.14.0"

  if Hardware::CPU.intel?
    sha256 "6aa825cea95208bbfd7a2fa1d7d4487ec15bc5feae95dbee97e481d5b1c37043"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "8b7908904135e66cac7618d65e84c9570e15ad2155be168f44bde420668a8232"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"
end
