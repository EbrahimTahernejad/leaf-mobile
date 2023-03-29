// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Leaf",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "Leaf", targets: ["Leaf"])
  ],
  targets: [
    .target(name: "Leaf", dependencies: ["LeafC"], path: "Sources/Leaf", sources: ["Leaf.swift"])
    .target(name: "LeafC", dependencies: ["LeafLib"], path: "Sources/LeafC")
    .binaryTarget(
      name: "LeafLib",
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/3.0.4/Leaf.xcframework.zip",
      checksum: "4ab706c7143eda74e13a3b6e600351adb85e271175ddd3c5b096dd2efb5363b0"
    )
  ]
)
