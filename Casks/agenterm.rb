cask "agenterm" do
  version "0.4.2"
  sha256 "10df51569248431a310b82e4ffb9b0935ffa339c1665a489c708b9d294140ee3"

  url "https://github.com/elionaz/agenterm/releases/download/v#{version}/agenterm-#{version}-macos-universal.zip"
  name "agenterm"
  desc "Desktop workspace for coding agents, organized by project"
  homepage "https://github.com/elionaz/agenterm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  # Since 0.4.2 the app updates itself (Sparkle), Homebrew installs included.
  # `auto_updates true` comes in a later release: brew reads it from this
  # cask, not from the installed app, so declaring it now would stop plain
  # `brew upgrade` from moving installs that still have Sparkle off (0.4.1
  # and earlier) onto a build that updates itself.

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
