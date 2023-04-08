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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/2.0.8/LibLeaf.xcframework.zip",
      checksum: "be0556b28f2a98bedaf258134d8cdd2d4f54b8d29e2768c7b92e37dfd5c9d6c9"
    )
  ]
)
