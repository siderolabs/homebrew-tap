# Homebrew Talos

## How do I install talosctl?

Installing talosctl from this cask is simple:

- `brew tap talos-systems/talos`
- `brew install --cask --no-quarantine talosctl`

`--no-quarantine` is flag is required as `talosctl` is not
[notarized](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution) yet.

## Updates

Currently, updates of this repository are manual
(see [talos-systems/talos#2148](https://github.com/talos-systems/talos/issues/2148)) and may be delayed.
If you rely on this tap, please send pull requests.

## Resources

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
