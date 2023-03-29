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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/1.0.0/Leaf.xcframework.zip",
      checksum: "5af16ef72a24996f3687f36b728ace35db56186bd5891432d69aae207d7732c0"
    )
  ]
)
