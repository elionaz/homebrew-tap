cask "agenterm" do
  version "0.2.0"
  sha256 "1b099943e546343f79f5a231f9e9b39b74b9d46587c3242819859858945a32f0"

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
