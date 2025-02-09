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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/2.2.0/LibLeaf.xcframework.zip",
      checksum: "c3773f89bb00327d2e80c94bb72282a8f427a0fd1792ed3bc80c1cfc671f8a5c"
    )
  ]
)
