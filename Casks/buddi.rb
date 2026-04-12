cask "buddi" do
  version "0.1.2"
  sha256 "2916e544e717e667816fc8547f60e23dbe60729c01debced0ad33f5e708b30eb"

  url "https://github.com/vietairs/Buddi/releases/download/v#{version}/Buddi.dmg"
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

  uninstall quit: "com.talkvalue.buddi"

  zap trash: [
    "~/Library/Preferences/com.talkvalue.buddi.plist",
    "~/Library/Application Support/Buddi",
  ]
end
