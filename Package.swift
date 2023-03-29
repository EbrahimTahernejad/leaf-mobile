// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Leaf",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "Leaf", targets: ["Leaf"])
  ],
  targets: [
    .target(name: "Leaf", dependencies: ["LeafC"], path: "Sources/Leaf", sources: ["Leaf.swift"]),
    .target(name: "LeafC", dependencies: ["LibLeaf"], path: "Sources/LeafC"),
    .binaryTarget(
      name: "LibLeaf",
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/1.0.6/LibLeaf.xcframework.zip",
      checksum: "68326ebf0324f20db0663a138e920a059337f77e6f79cd87915a3b648965aac9"
    )
  ]
)
