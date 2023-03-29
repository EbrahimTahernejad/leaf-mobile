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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/1.0.7/LibLeaf.xcframework.zip",
      checksum: "2a2a451b9bd2d2b167bc77266ae74d299e6fb56d35d332231da3381ced9e9542"
    )
  ]
)
