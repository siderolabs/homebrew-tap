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
unversioned formulae:

| Formula | Available versions |
| --- | --- |
| `omnictl` | `@1.7`, `@1.8`, `@1.9`, `@1.10` |
| `talosctl` | `@1.10`, `@1.11`, `@1.12`, `@1.13` |

The unversioned formulae (`omnictl`, `talosctl`) continue to track the latest
release and are linked into your `PATH`.

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
Example Usage:

```
./update.sh <tool> <version>
./update.sh talosctl 1.13.0
./update.sh omnictl 1.11.2
./update.sh "omnictl@1.10" 1.10.5
./update.sh "talosctl@1.13" 1.13.11
```

When a new minor release line is introduced (e.g. a first `1.11.x` release),
add a versioned formula manually. `update.sh` keeps existing formulae in sync
with patches, but it does not create new files.

For a new `omnictl@1.11`:

1. Copy an existing formula as a template:

    ```bash
    cp Formula/omnictl@1.10.rb Formula/omnictl@1.11.rb
    ```

2. Rename the Ruby class so it matches Homebrew's `name@version.rb` →
   `NameATVersion` rule (digits from the version, dots stripped). For
   `omnictl@1.11` that is `OmnictlAT110` → `OmnictlAT111`:

    ```ruby
    class OmnictlAT111 < Formula
    ```

3. Update the pinned `version`:

    ```ruby
    version "1.11.0"
    ```

4. Refresh the SHA256 sums (downloads every platform binary and rewrites the
   file in place):

    ```bash
    ./update.sh "omnictl@1.11" 1.11.0
    ```

5. Add the new minor to the **Available versions** table at the top of this
   README so the documented list stays in sync with the formulae shipped.

6. Keep `keg_only :versioned_formula` — it must stay in every versioned
   formula so users can install multiple versions side-by-side.

Once the file exists, future patches on that release line only require
`./update.sh "omnictl@1.11" <patch-version>` (see the examples above).

## Resources

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
