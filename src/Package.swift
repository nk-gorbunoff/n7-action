// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "Autobots",
    products: [
        .executable(name: "Autobots", targets: ["Autobots"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "Autobots",
            dependencies: []
        )
    ]
)
