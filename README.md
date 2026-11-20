# Finjineersdev Homebrew tap

```bash
brew tap finjineersdev/tap && brew trust finjineersdev/tap   # once
brew install --cask finjineersdev/tap/opensweep
```

[OpenSweep](https://github.com/Finjineersdev/OpenSweep) is an open-source
developer disk cleaner for macOS 14+. The cask installs the app and puts the
`opensweep` command on your PATH. It follows the latest release on its own
(`.github/workflows/update.yml`).

The app is not notarized by Apple: on first launch, open System Settings >
Privacy & Security and click "Open Anyway".
