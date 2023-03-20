// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Leaf",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "Leaf", targets: ["Leaf"])
  ],
  targets: [
    .binaryTarget(
      name: "Leaf",
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/0.1.0/Leaf.xcframework.zip",
      checksum: "9f0c950e1a038864fae54e10f429cc103dbbf7efe3d973d50797316853b0587e"
    )
  ]
)
