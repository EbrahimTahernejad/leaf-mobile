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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/0.1.1/Leaf.xcframework.zip",
      checksum: "9a07e9352953b25e9cbeaabc145db5823fb9ed1e19a0b7feea73980b7cc82e8d"
    )
  ]
)
