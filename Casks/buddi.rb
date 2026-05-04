cask "buddi" do
  version "0.2.13"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

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
