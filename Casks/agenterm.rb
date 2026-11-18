cask "agenterm" do
  version "0.8.0"
  sha256 "217df1c11557ef3d7268fe0f417949a7064bf5a32601324de5f413ec8b8575b7"

  url "https://github.com/elionaz/agenterm/releases/download/v#{version}/agenterm-#{version}-macos-universal.zip"
  name "agenterm"
  desc "Desktop workspace for coding agents, organized by project"
  homepage "https://github.com/elionaz/agenterm"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Since 0.4.2 the app updates itself (Sparkle), Homebrew installs included,
  # so plain `brew upgrade` skips it (`--greedy` or naming the cask doesn't).
  auto_updates true
  depends_on macos: :ventura

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
