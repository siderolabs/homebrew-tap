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

Versioned formulae are available for pinned release lines alongside the
unversioned formulae. The unversioned formulae (`omnictl`, `talosctl`) track
the latest release and are linked into your `PATH`.

```bash
brew tap siderolabs/tap
brew install siderolabs/tap/omnictl@1.9
brew install siderolabs/tap/talosctl@1.13
```

Versioned formulae are installed as `keg_only`, so they can coexist with the
unversioned formulae. Because they are not linked by default, invoke their
binaries directly from the keg or link them on top:

```bash
$(brew --prefix siderolabs/tap/omnictl@1.10)/bin/omnictl --version

# or link the versioned binary on top of the unversioned one
brew link --force siderolabs/tap/omnictl@1.10
```

## Updates

Currently, updates of this repository are manual
(see [siderolabs/talos#2148](https://github.com/siderolabs/talos/issues/2148)) and may be delayed.
If you rely on this tap, please send pull requests.

To manually update formulas in this repo, fork and clone this repo then run `./update.sh`.
The script accepts the tool name (`talos` or `omni`) and the new version. It updates both
the rolling formula and the matching versioned formula, creating the versioned formula if
it does not exist yet.

```
./update.sh <tool> <version>
./update.sh talos 1.14.1
./update.sh omni 1.11.3
```

## Resources

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
