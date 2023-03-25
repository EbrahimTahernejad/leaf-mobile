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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/0.1.2/Leaf.xcframework.zip",
      checksum: "3380505339096994adf1b0b57d4c577996b91a48e139402140a75ec067e4bd78"
    )
  ]
)
