# Homebrew Talos

## How do I install talosctl?

Installing talosctl from this cask is simple:

- `brew tap siderolabs/talos`
- `brew install --cask --no-quarantine talosctl`

`--no-quarantine` is flag is required as `talosctl` is not
[notarized](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution) yet.

Note that the arguments must be passed when upgrading as well:

- `brew upgrade --cask --no-quarantine talosctl`

If you accidentally upgrade the forumla without the `--no-quarantine` argument you may have to reinstall talosctl:

- `brew reinstall --cask --no-quarantine talosctl`

## Updates

Currently, updates of this repository are manual
(see [siderolabs/talos#2148](https://github.com/siderolabs/talos/issues/2148)) and may be delayed.
If you rely on this tap, please send pull requests.

## Resources

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
