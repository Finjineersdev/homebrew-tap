cask "opensweep" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/Finjineersdev/OpenSweep/releases/download/v#{version}/OpenSweep-#{version}.dmg"
  name "OpenSweep"
  desc "Developer disk cleaner that quarantines rebuildable project folders"
  homepage "https://github.com/Finjineersdev/OpenSweep"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "OpenSweep.app"
  binary "#{appdir}/OpenSweep.app/Contents/Helpers/opensweep"

  caveats <<~EOS
    OpenSweep is open source and not notarized by Apple, so macOS blocks the
    first launch. Open System Settings > Privacy & Security and click
    "Open Anyway" next to OpenSweep. After each update, turn Full Disk Access
    for OpenSweep off and on again if a scan stops seeing your folders.
  EOS

  # Zap also removes the quarantine: restore or purge every run first.
  zap trash: [
    "~/Library/Application Support/OpenSweep",
    "~/Library/Caches/com.finjineers.opensweep",
    "~/Library/Preferences/com.finjineers.opensweep.plist",
  ]
end
