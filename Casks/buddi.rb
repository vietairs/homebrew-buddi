cask "buddi" do
  version "0.2.42"
  sha256 "d2cd24a1867525966656a240e1f6d32c1852c2cb8e1ef0eb87264ac6dd766a87"

  url "https://github.com/vietairs/buddi-releases/releases/download/v#{version}/buddi-#{version}.dmg"
  name "Buddi"
  desc "Claude Code companion for the macOS notch"
  homepage "https://vietairs.github.io/buddi-releases/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "buddi.app"

  caveats <<~EOS
    Buddi is not notarized. After installation, run:
      sudo xattr -dr com.apple.quarantine \#{appdir}/buddi.app
    Then reopen the app.
  EOS

  uninstall quit: "com.talkvalue.buddi"

  zap trash: [
    "~/Library/Preferences/com.talkvalue.buddi.plist",
    "~/Library/Application Support/Buddi",
  ]
end
