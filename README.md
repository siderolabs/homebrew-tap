# Sidero Labs Homebrew Tap

- 🔥 Easy installation of [talosctl](https://github.com/siderolabs/talos), the reference CLI to use Talos OS
- 🔥 Easy installation of [omnictl](https://github.com/siderolabs/omni), the reference CLI to use Omni
- ⭐ Talosctl works on macOS (Intel/ARM) and Linux (amd64/arm64/armv7)
- ⭐ Omnictl works on macOS (Intel/ARM) and Linux (amd64/arm64)

## How do I install talosctl?

Installing talosctl is simple:
```
brew install siderolabs/tap/talosctl
```

You can also only add the tap which makes formulae within it available in search results (`brew search` output):

```
brew tap siderolabs/tap
brew install talosctl
```

## How do I install omnictl?

Installing omnictl is simple:
```
brew install siderolabs/tap/omnictl
```

You can also only add the tap which makes formulae within it available in search results (`brew search` output):

```
brew tap siderolabs/tap
brew install omnictl
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
