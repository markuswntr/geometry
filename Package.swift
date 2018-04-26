// swift-tools-version:4.1
import PackageDescription

let package = Package(
    name: "Geometry",
    products: [
        .library(
            name: "Geometry",
            targets: ["Geometry"]
        )
    ],
    targets: [
        .target(
            name: "Geometry",
            path: "Sources"
        ),
        .testTarget(
            name: "GeometryTests",
            dependencies: ["Geometry"]
        )
    ]
)
