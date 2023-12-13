// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Leaf",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "Leaf", targets: ["Leaf"])
  ],
  targets: [
    .target(name: "Leaf", dependencies: ["LibLeaf"], path: "Sources/Leaf", sources: ["Leaf.swift"]),
    .binaryTarget(
      name: "LibLeaf",
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/2.1.4/LibLeaf.xcframework.zip",
      checksum: "c0c60a6d7cf53886419a44164a02d1affaec6cc99f37c6c8a908e1b5a6c2391e"
    )
  ]
)
