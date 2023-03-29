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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/1.0.2/LibLeaf.xcframework.zip",
      checksum: "00a5a543af75b9021f9c59527df1e63b7df6cedcc4ad47316de822a1e1cb7fec"
    )
  ]
)
