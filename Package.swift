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
    .target(name: "LeafC", dependencies: ["LibLeaf"], path: "Sources/LeafC")
    .binaryTarget(
      name: "LibLeaf",
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/1.0.3/LibLeaf.xcframework.zip",
      checksum: "6e42de655e4c3343898d4caf6f4e510e3c45da2a621b2c9a65af69671b9f2760"
    )
  ]
)
