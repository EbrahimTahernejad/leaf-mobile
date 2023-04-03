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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/2.0.5/LibLeaf.xcframework.zip",
      checksum: "89946a5f6fd02253424b9e89006f9f7fe363432cbda9c3a67e79a9346fb95e65"
    )
  ]
)
