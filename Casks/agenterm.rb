cask "agenterm" do
  version "0.4.1"
  sha256 "65dcf91da8a2897685c14ab97faa08a61d20cdc19b367e530bd3bf1e7bc740f0"

  url "https://github.com/elionaz/agenterm/releases/download/v#{version}/agenterm-#{version}-macos-universal.zip"
  name "agenterm"
  desc "Desktop workspace for coding agents, organized by project"
  homepage "https://github.com/elionaz/agenterm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  # No `auto_updates true`: the app detects that this cask installed it and
  # turns its Sparkle updater off, so `brew upgrade` stays the only updater
  # (and `brew outdated` keeps reporting new versions).

  app "agenterm.app"
  binary "#{appdir}/agenterm.app/Contents/Helpers/agenterm"

  zap trash: [
    "~/.agenterm",
    "~/.config/agenterm",
    "~/Library/Caches/com.elionaz.agenterm",
    "~/Library/Preferences/com.elionaz.agenterm.plist",
    "~/Library/Saved Application State/com.elionaz.agenterm.savedState",
    "~/Library/WebKit/com.elionaz.agenterm",
  ]
end
