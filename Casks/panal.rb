cask "panal" do
  version "0.16.0"
  sha256 "f0602b11f553f905611c9633b89b1ac8deb78cc12b2434be1ca729b88246e078"

  url "https://github.com/elionaz/panal/releases/download/v#{version}/panal-#{version}-macos-universal.zip"
  name "panal"
  desc "Desktop workspace for coding agents, organized by project"
  homepage "https://github.com/elionaz/panal"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Since 0.4.2 the app updates itself (Sparkle), Homebrew installs included,
  # so plain `brew upgrade` skips it (`--greedy` or naming the cask doesn't).
  auto_updates true
  depends_on macos: :ventura

  app "panal.app"
  binary "#{appdir}/panal.app/Contents/Helpers/panal"
  # The CLI's name before the rename to panal, kept for scripts for a while.
  binary "#{appdir}/panal.app/Contents/Helpers/panal", target: "agenterm"

  zap trash: [
    "~/.panal",
    "~/.config/panal",
    "~/Library/Caches/com.elionaz.agenterm",
    "~/Library/Preferences/com.elionaz.agenterm.plist",
    "~/Library/Saved Application State/com.elionaz.agenterm.savedState",
    "~/Library/WebKit/com.elionaz.agenterm",
    # From before the rename to panal.
    "~/.agenterm",
    "~/.config/agenterm",
  ]
end
