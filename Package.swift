// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Geometry",
    products: [
        .library(name: "Geometry", targets: ["Geometry"])
    ],
    dependencies: [
        .package(url: "https://github.com/markuswntr/vector.git", .branch("master"))
    ],
    targets: [
        .target(name: "Geometry", dependencies: ["Vector"]),
        .testTarget(name: "GeometryTests", dependencies: ["Geometry"])
    ]
)
