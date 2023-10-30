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
      url: "https://github.com/EbrahimTahernejad/leaf-mobile/releases/download/2.1.2/LibLeaf.xcframework.zip",
      checksum: "15241cb0cbe81e051ed78a7ebd614a3c201e5469ea5edf03a044361df1f45b8b"
    )
  ]
)
