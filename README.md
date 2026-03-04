# Sidero Labs Homebrew Tap

- 🔥 Easy installation of [talosctl](https://github.com/siderolabs/talos), the reference CLI to use Talos OS
- 🔥 Easy installation of [omnictl](https://github.com/siderolabs/omni), the reference CLI to use Omni
- ⭐ Talosctl works on macOS (Intel/ARM) and Linux (amd64/arm64/armv7)
- ⭐ Omnictl works on macOS (Intel/ARM) and Linux (amd64/arm64)

## Install all Sidero Labs tools

There is a meta formulae for the common tools:

```bash
brew install siderolabs/tap/sidero-tools
```

This includes `talosctl`, `omnictl`, `kubectl-oidc_login`, and `kubectl`.

> Note: `kubectl` and `kubectl-oidc_login` are not maintained by Sidero Labs, but they are included in the meta formulae for convenience.

## Install tools separately

You can also add the tap and install tools separately.
This makes formulae within it available in search results (`brew search` output):

```bash
brew tap siderolabs/tap
brew install talosctl omnictl
```

## Install specific major/minor versions

Versioned formulae are also available for pinned release lines:

```bash
brew tap siderolabs/tap
brew install siderolabs/tap/omnictl@1
brew install siderolabs/tap/omnictl@1.4
brew install siderolabs/tap/omnictl@1.4.11
brew install siderolabs/tap/talosctl@1.12
```

If the unversioned formula is already installed, unlink it first (or uninstall it), as both install the same binary names:

```bash
brew unlink omnictl talosctl
brew install siderolabs/tap/omnictl@1.4 siderolabs/tap/talosctl@1.12
```

## Updates

Currently, updates of this repository are manual
(see [siderolabs/talos#2148](https://github.com/siderolabs/talos/issues/2148)) and may be delayed.
If you rely on this tap, please send pull requests.

To manually update formulas in this repo, fork and clone this repo then run `./update.sh`.
Example Usage:

```
./update.sh <tool> <version>
./update.sh talosctl 1.6.6
./update.sh omnictl 0.31.0
```

## Resources

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
