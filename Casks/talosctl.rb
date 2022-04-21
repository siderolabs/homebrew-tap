# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.0.3"

  if Hardware::CPU.intel?
    sha256 "62598b22bb1b0db3b8d1444e0ce8caa415c39cab60b7b2f75ce4d612b8ebc000"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "6b8ec938b026b7bec10587adede959b6a947c86e0808e22fa412ac7aa3a20e43"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"
end
