cask "macdictation" do
  version "1.2.0"
  sha256 "b6d91547ff46011730ce14beeb20fc21dc6128dbde683c6b49efe8aa1caef2fe"

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
