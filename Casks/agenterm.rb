cask "agenterm" do
  version "0.3.0"
  sha256 "30ddfad88c4a9272682214aefa6459db5a2bd4f7c0dc4125552a8fd5cf51a6cd"

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
