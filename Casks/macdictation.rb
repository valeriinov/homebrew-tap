cask "macdictation" do
  version "1.1.2"
  sha256 "f63d2a20a40bb42cf9799f07df373f3de47952d800d3e495cfe6cc9204100ebc"

  url "https://github.com/valeriinov/macdictation/releases/download/v#{version}/MacDictation-#{version}.zip"
  name "MacDictation"
  desc "Menu bar dictation with on-device speech recognition"
  homepage "https://valeriinov.github.io/macdictation/setup.html"

  livecheck do
    url "https://github.com/valeriinov/macdictation/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "MacDictation.app"

  zap trash: [
    "~/Library/Application Support/com.valeriinovykov.MacDictation",
    "~/Library/Application Support/FluidAudio/Models/parakeet-tdt-0.6b-v3",
    "~/Library/Application Support/FluidAudio/Models/parakeet-ultra",
    "~/Library/Preferences/com.valeriinovykov.MacDictation.plist",
  ]
end
