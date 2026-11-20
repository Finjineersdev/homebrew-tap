cask "agentclean" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/Finjineersdev/AgentClean/releases/download/v#{version}/AgentClean-#{version}.dmg"
  name "AgentClean"
  desc "Developer disk cleaner that quarantines rebuildable project folders"
  homepage "https://github.com/Finjineersdev/AgentClean"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "AgentClean.app"
  binary "#{appdir}/AgentClean.app/Contents/Helpers/agentclean"

  caveats <<~EOS
    AgentClean is open source and not notarized by Apple, so macOS blocks the
    first launch. Open System Settings > Privacy & Security and click
    "Open Anyway" next to AgentClean. After each update, turn Full Disk Access
    for AgentClean off and on again if a scan stops seeing your folders.
  EOS

  # Zap also removes the quarantine: restore or purge every run first.
  zap trash: [
    "~/Library/Application Support/AgentClean",
    "~/Library/Caches/com.finjineers.agentclean",
    "~/Library/Preferences/com.finjineers.agentclean.plist",
  ]
end
