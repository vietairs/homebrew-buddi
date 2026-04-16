cask "buddi" do
  version "0.1.11"
  sha256 "021e562f6bc07e9178bea1f7a4c6a338408055fd81271951b2542c9cbc1b23fd"

  url "https://github.com/vietairs/Buddi/releases/download/v#{version}/buddi-#{version}.dmg"
  name "Buddi"
  desc "Claude Code companion for the macOS notch"
  homepage "https://github.com/vietairs/Buddi"

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
